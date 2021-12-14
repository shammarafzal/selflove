import 'dart:async';

import 'package:flutter/material.dart';
import 'package:self_love/Components/customButton.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:self_love/Settings/alertDialog.dart';

class InAppPurchaseScreen extends StatefulWidget {
  const InAppPurchaseScreen({Key? key}) : super(key: key);

  @override
  _InAppPurchaseScreenState createState() => _InAppPurchaseScreenState();
}

class _InAppPurchaseScreenState extends State<InAppPurchaseScreen> {
 final InAppPurchase _inAppPurchase = InAppPurchase.instance;
 final String _productID = "User_Monthly_Subscription";
 bool _available = true;
 List<ProductDetails> _products = [];
 List<PurchaseDetails> _purchases = [];
 StreamSubscription<List<PurchaseDetails>>? _subscription;
 @override
 void initState() {
   final Stream<List<PurchaseDetails>> purchaseUpdated =
       _inAppPurchase.purchaseStream;

   _subscription = purchaseUpdated.listen((purchaseDetailsList) {
     setState(() {
       _purchases.addAll(purchaseDetailsList);
       _listenToPurchaseUpdated(purchaseDetailsList);
     });
   }, onDone: () {
     _subscription!.cancel();
   }, onError: (error) {
     _subscription!.cancel();
   });

   _initialize();

   super.initState();
 }
 void _initialize() async {
   _available = await _inAppPurchase.isAvailable();

   List<ProductDetails> products = await _getProducts(
     productIds: Set<String>.from(
       [_productID],
     ),
   );

   setState(() {
     _products = products;
   });
 }

 void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
   purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
     switch (purchaseDetails.status) {
       case PurchaseStatus.pending:
       //  _showPendingUI();
         break;
       case PurchaseStatus.purchased:
       case PurchaseStatus.restored:
       // bool valid = await _verifyPurchase(purchaseDetails);
       // if (!valid) {
       //   _handleInvalidPurchase(purchaseDetails);
       // }
         break;
       case PurchaseStatus.error:
         print(purchaseDetails.error!);
         // _handleError(purchaseDetails.error!);
         break;
       default:
         break;
     }

     if (purchaseDetails.pendingCompletePurchase) {
       await _inAppPurchase.completePurchase(purchaseDetails);
     }
   });
 }
 Future<List<ProductDetails>> _getProducts(
     {required Set<String> productIds}) async {
   ProductDetailsResponse response =
   await _inAppPurchase.queryProductDetails(productIds);

   return response.productDetails;
 }
 void _subscribe({required ProductDetails product}) {
   final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
   _inAppPurchase.buyNonConsumable(
     purchaseParam: purchaseParam,
   );
   if ( _purchases[0].status == PurchaseStatus.purchased) {
     Navigator.of(context).pushReplacementNamed('/login');
   }
   else {
     alertScreen().showToast("Error");
   }
 }


 @override
 void dispose() {
   _subscription!.cancel();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(254,176,149, 0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: SizeConfig.screenHeight * 0.75,
                    child: ListView(
                      children: [
                        Image.asset(
                          'assets/self_logo.png',
                          width: 100,
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              'Subscribe Now',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              '\$ 7.99',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 36),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              'Get Unlimited Access to:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            '- Daily Challenges\n- 24/7 girl talk\n- Positive quotes and mantras\n- Advice from qualified professionals\n- Reflection and planning space for you\n- My personal journey with self-love and confidence tips\n- A safe and positive forum to interact with other on the same journey',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: CustomButton(title: 'Subscribe', onPress: (){
                            _subscribe(product: _products[0]);
                            //Navigator.of(context).pushReplacementNamed('/login');
                          },),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: (){
                    // Navigator.of(context).pushReplacementNamed('signup_screen');
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'For More Informatio, See Our ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(text: 'Terms ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'and '),
                        TextSpan(text: 'Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
