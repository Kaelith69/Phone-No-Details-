import 'package:flutter/material.dart';

import '../models/phone_details.dart';
import '../services/phone_service.dart';

/// Main screen that lets the user look up details for a phone number.
class PhoneDetailsScreen extends StatefulWidget {
  const PhoneDetailsScreen({super.key});

  @override
  State<PhoneDetailsScreen> createState() => _PhoneDetailsScreenState();
}

class _PhoneDetailsScreenState extends State<PhoneDetailsScreen> {
  final _controller = TextEditingController();
  final _service = const PhoneService();

  PhoneDetails? _details;
  String? _error;
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _validateNumber() async {
    final number = _controller.text.trim();
    if (number.isEmpty) {
      setState(() {
        _error = 'Please enter a phone number.';
        _details = null;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
      _details = null;
    });

    try {
      final result = await _service.validateNumber(number);
      setState(() {
        _details = result;
      });
    } catch (e) {
      setState(() {
        _error = 'Could not fetch details. Please check your connection and try again.';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Enter phone number (e.g. +14155552671)',
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shadowColor: Colors.teal,
              ),
              onPressed: _isLoading ? null : _validateNumber,
              child: const Text('Get Details'),
            ),
            const SizedBox(height: 16.0),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_details != null)
              _DetailsCard(details: _details!)
            else if (_error != null)
              Text(
                _error!,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}

/// Card widget that renders the fields from a [PhoneDetails] response.
class _DetailsCard extends StatelessWidget {
  const _DetailsCard({required this.details});

  final PhoneDetails details;

  @override
  Widget build(BuildContext context) {
    final rows = <_DetailRow>[
      _DetailRow(label: 'Valid', value: details.valid ? 'Yes ✓' : 'No ✗'),
      _DetailRow(label: 'Number', value: details.number),
      _DetailRow(label: 'Local Format', value: details.localFormat),
      _DetailRow(label: 'International Format', value: details.internationalFormat),
      _DetailRow(label: 'Country Code', value: details.countryCode),
      _DetailRow(label: 'Country Name', value: details.countryName),
      _DetailRow(label: 'Location', value: details.location),
      _DetailRow(label: 'Carrier', value: details.carrier),
      _DetailRow(label: 'Line Type', value: details.lineType),
    ];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            color: const Color(0xFF343434),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(102),
                spreadRadius: 5,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            itemCount: rows.length,
            separatorBuilder: (_, __) => const Divider(
              color: Colors.white24,
              height: 1,
            ),
            itemBuilder: (_, index) => rows[index],
          ),
        ),
      ),
    );
  }
}

/// A single label/value row inside the details card.
class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
            child: Text(
              value.isNotEmpty ? value : '—',
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
