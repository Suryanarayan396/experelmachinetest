appBar: AppBar(
            backgroundColor: Colors.white,
            title: InkWell(
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Shadow color
                    offset: Offset(4, 4), // Shadow position
                    blurRadius: 10, // Softness of the shadow
                    spreadRadius: 1, // Size of the shadow
                  )
                ]),
                child: Center(
                  child: Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ),
            actions: [
              InkWell(
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Shadow color
                      offset: Offset(4, 4), // Shadow position
                      blurRadius: 10, // Softness of the shadow
                      spreadRadius: 1, // Size of the shadow
                    )
                  ]),
                  child: Center(
                    child: Icon(Icons.shopping_cart),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),