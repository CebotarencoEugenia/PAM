import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conversie monedă',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController amountController = TextEditingController();

  String fromCurrency = 'MDL';
  String toCurrency = 'EUR';

  String result = '';

  // Cursuri fixe raportate la MDL
  final Map<String, double> rates = {
    'MDL': 1.0,
    'EUR': 19.50,
    'USD': 17.60,
    'RON': 3.90,
  };

  void convertCurrency() {
    double? amount = double.tryParse(
      amountController.text.replaceAll(',', '.'),
    );

    if (amount == null || amount < 0) {
      setState(() {
        result = 'Introduceți o sumă validă!';
      });
      return;
    }

    // Transformăm suma inițială în MDL
    double amountInMDL = amount * rates[fromCurrency]!;

    // Transformăm din MDL în moneda destinație
    double convertedAmount = amountInMDL / rates[toCurrency]!;

    setState(() {
      result =
      '${amount.toStringAsFixed(2)} $fromCurrency = '
          '${convertedAmount.toStringAsFixed(2)} $toCurrency';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator conversie monedă'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Conversie valutară',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: amountController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Suma',
                hintText: 'Introduceți suma',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.money),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: fromCurrency,
              decoration: const InputDecoration(
                labelText: 'Moneda sursă',
                border: OutlineInputBorder(),
              ),
              items: rates.keys.map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  fromCurrency = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: toCurrency,
              decoration: const InputDecoration(
                labelText: 'Moneda destinație',
                border: OutlineInputBorder(),
              ),
              items: rates.keys.map((String currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  toCurrency = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: convertCurrency,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'CONVERTEȘTE',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              result,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Cursuri fixe utilizate:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text('1 EUR = 19.50 MDL'),
            const Text('1 USD = 17.60 MDL'),
            const Text('1 RON = 3.90 MDL'),
          ],
        ),
      ),
    );
  }
}