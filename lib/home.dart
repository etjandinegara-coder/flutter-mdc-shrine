// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'package:mdc_100_series/model/product.dart';
import 'package:mdc_100_series/model/products_repository.dart';
import 'package:mdc_100_series/supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.category = Category.all,}) : super(key: key);

  List<Product> get products =>
      ProductsRepository.loadProducts(category);

  final Category category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AsymmetricView(
        products: products,
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}