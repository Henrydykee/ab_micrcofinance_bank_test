import 'package:flutter/material.dart';

import '../../data/model/investment_model.dart';
import '../../domain/repo/investment_repo.dart';

class InvestmentProvider with ChangeNotifier {
  List<InvestmentModel> _investments = [];
  List<InvestmentModel> _filteredInvestments = [];
  bool _isLoading = false;
  String? _error;
  String? _selectedFilter;
  String _searchQuery = '';

  List<InvestmentModel> get investments => _filteredInvestments.isEmpty ? [] : _filteredInvestments;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get selectedFilter => _selectedFilter;

  final InvestmentRepository _repository;

  InvestmentProvider(this._repository);

  Future<void> fetchInvestments() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _investments = await _repository.getInvestments();
      _filteredInvestments = _investments;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load investments';
      notifyListeners();
    }
  }

  void filterInvestments(String? filter) {
    _selectedFilter = filter;
    _applyFilters();
  }

  void searchInvestments(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void clearFilter() {
    _selectedFilter = null;
    _applyFilters();
  }

  void _applyFilters() {
    _filteredInvestments = _investments.where((investment) {
      final matchesFilter = _selectedFilter == null ||
          investment.type.toLowerCase() == _selectedFilter!.toLowerCase();
      final matchesSearch = _searchQuery.isEmpty ||
          investment.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();
    notifyListeners();
  }
}
