void lifeDisplay(int wrongGuesses) {
  switch(wrongGuesses) {
    case 6:
      print('''
      
# # # #
#     *
#     O
#   /||\\
#    /\\
#
#

      ''');
      break;
    case 5:
      print('''

# # # #
#     *
#     O
#   /||\\
#    /
#
#

      ''');
      break;
    case 4:
      print('''

# # # #
#     *
#     O
#   /||\\
#    
#
#

      ''');
      break;
    case 3:
      print('''

# # # #
#     *
#     O
#   /||
#    
#
#

      ''');
      break;
    case 2:
      print('''

# # # #
#     *
#     O
#    ||
#    
#
#

      ''');
      break;
    case 1:
      print('''

# # # #
#     *
#     O
#   
#    
#
#

      ''');
      break;
    default:
      print('''

# # # #
#     *
#   
#   
#    
#
#

      ''');
  }
}
