import '../models/restaurant.dart';
import '../models/menu_item.dart';

final List<Restaurant> restaurants = [
  Restaurant(
    name: 'La Piazza',
    image: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    menu: [
      MenuItem(
        name: 'Margherita Pizza',
        description: 'Classic pizza with tomato sauce, mozzarella, and basil',
        price: 12.99,
        image: 'https://images.unsplash.com/photo-1567602901358-5ba00815eb15?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Pepperoni Pizza',
        description: 'Traditional pizza with pepperoni and mozzarella',
        price: 14.99,
        image: 'https://images.unsplash.com/photo-1628840042765-356cda07504e?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Vegetarian Pizza',
        description: 'Loaded with fresh vegetables and cheese',
        price: 13.99,
        image: 'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Supreme Pizza',
        description: 'Pepperoni, sausage, peppers, onions, and mushrooms',
        price: 16.99,
        image: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Hawaiian Pizza',
        description: 'Ham, pineapple, and mozzarella',
        price: 15.99,
        image: 'https://images.unsplash.com/photo-1595708684082-a173bb3a06c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
    ],
  ),
  Restaurant(
    name: 'Burger Heaven',
    image: 'https://images.unsplash.com/photo-1552566626-52f8b828add9?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    menu: [
      MenuItem(
        name: 'Classic Cheeseburger',
        description: 'Beef patty with cheese, lettuce, and special sauce',
        price: 9.99,
        image: 'https://images.unsplash.com/photo-1553979459-d2229ba7433b?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Bacon Deluxe',
        description: 'Double beef with bacon, cheese, and onion rings',
        price: 12.99,
        image: 'https://images.unsplash.com/photo-1551782450-a2132b4ba21d?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Veggie Burger',
        description: 'Plant-based patty with fresh vegetables',
        price: 10.99,
        image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Mushroom Swiss',
        description: 'Beef patty with sautéed mushrooms and Swiss cheese',
        price: 11.99,
        image: 'https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
    ],
  ),
  Restaurant(
    name: 'Tokyo Sushi',
    image: 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    menu: [
      MenuItem(
        name: 'California Roll',
        description: 'Crab, avocado, and cucumber',
        price: 8.99,
        image: 'https://images.unsplash.com/photo-1617196034796-73dfa7e1f3e3?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Dragon Roll',
        description: 'Eel, avocado, and cucumber with eel sauce',
        price: 14.99,
        image: 'https://images.unsplash.com/photo-1611143669185-af224c5e3252?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Salmon Nigiri',
        description: 'Fresh salmon over rice',
        price: 7.99,
        image: 'https://images.unsplash.com/photo-1610747160248-8fa2c6f8f6c3?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Sashimi Platter',
        description: 'Assorted fresh raw fish',
        price: 22.99,
        image: 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
    ],
  ),
  Restaurant(
    name: 'Local Delights',
    image: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
    menu: [
      MenuItem(
        name: 'Jollof Rice',
        description: 'Spicy tomato rice with chicken',
        price: 11.99,
        image: 'https://images.unsplash.com/photo-1604909053587-5c4848e284ad?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Banku with Tilapia',
        description: 'Fermented corn dough with grilled fish',
        price: 13.99,
        image: 'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Waakye',
        description: 'Rice and beans with spaghetti and stew',
        price: 10.99,
        image: 'https://images.unsplash.com/photo-1546549032-9571cd6b27df?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
      MenuItem(
        name: 'Fufu with Light Soup',
        description: 'Pounded cassava and plantain with soup',
        price: 12.99,
        image: 'https://images.unsplash.com/photo-1541519227354-08fa5d50c44d?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80',
      ),
    ],
  ),
];
