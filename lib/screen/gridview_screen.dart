import 'package:flutter/material.dart';

class GridViewBuilderExample extends StatefulWidget {
  const GridViewBuilderExample({super.key});

  @override
  State<GridViewBuilderExample> createState() => _GridViewBuilderExampleState();
}

class _GridViewBuilderExampleState extends State<GridViewBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gridview Builder'),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => GridTile(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[50], // Light background color
              borderRadius: BorderRadius.circular(12), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(12), // Rounded corners for the image
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      'assets/product-${index + 1}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'Product $index',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      '\$${(index + 1) * 5}.99',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: Colors.red,
                        onPressed: () {
                          // Add functionality for 'Favorite'
                          print('Favorite: Product $index');
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.green,
                        onPressed: () {
                          // Add functionality for 'Add to Cart'
                          print('Add to cart: Product $index');
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.credit_card),
                        color: Colors.blue,
                        onPressed: () {
                          // Add functionality for 'Buy Now'
                          print('Buy now: Product $index');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        itemCount: 5,
      ),
    );
  }
}
