shoppingCart = []

print('add items to a cart when prompted')
print('Press V to view what is in the cart')
cartItem = input('What would you like to add?: ')

while cartItem != 'V':
    shoppingCart.append(cartItem)
    addItem = input('What else would you like to add?: ')
    shoppingCart.append(addItem)

    if cartItem == 'V':
        print(shoppingCart)

