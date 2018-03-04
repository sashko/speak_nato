/*
 * Code that performs translation to phonetic alphabet
*/

String textToNato(String str) {
    String phoneticNatoText = "";

    for (int i = 0; i < str.length; i++) {
      switch (str[i]) {
        case "a":
        case "A":
          phoneticNatoText += "Alpha ";
          break;
        case "b":
        case "B":
          phoneticNatoText += "Bravo ";
          break;
        case "c":
        case "C":
          phoneticNatoText += "Charlie ";
          break;
        case "d":
        case "D":
          phoneticNatoText += "Delta ";
          break;
        case "e":
        case "E":
          phoneticNatoText += "Echo ";
          break;
        case "f":
        case "F":
          phoneticNatoText += "Foxtrot ";
          break;
        case "g":
        case "G":
          phoneticNatoText += "Golf ";
          break;
        case "h":
        case "H":
          phoneticNatoText += "Hotel ";
          break;
        case "i":
        case "I":
          phoneticNatoText += "India ";
          break;
        case "j":
        case "J":
          phoneticNatoText += "Juliett ";
          break;
        case "k":
        case "K":
          phoneticNatoText += "Kilo ";
          break;
        case "l":
        case "L":
          phoneticNatoText += "Lima ";
          break;
        case "m":
        case "M":
          phoneticNatoText += "Mike ";
          break;
        case "n":
        case "N":
          phoneticNatoText += "November ";
          break;
        case "o":
        case "O":
          phoneticNatoText += "Oscar ";
          break;
        case "p":
        case "P":
          phoneticNatoText += "Papa ";
          break;
        case "q":
        case "Q":
          phoneticNatoText += "Quebec ";
          break;
        case "r":
        case "R":
          phoneticNatoText += "Romeo ";
          break;
        case "s":
        case "S":
          phoneticNatoText += "Sierra ";
          break;
        case "t":
        case "T":
          phoneticNatoText += "Tango ";
          break;
        case "u":
        case "U":
          phoneticNatoText += "Uniform ";
          break;
        case "v":
        case "V":
          phoneticNatoText += "Victor ";
          break;
        case "w":
        case "W":
          phoneticNatoText += "Whiskey ";
          break;
        case "x":
        case "X":
          phoneticNatoText += "Xray ";
          break;
        case "y":
        case "Y":
          phoneticNatoText += "Yankee ";
          break;
        case "z":
        case "Z":
          phoneticNatoText += "Zulu ";
          break;
        case "0":
          phoneticNatoText += "Zero ";
          break;
        case "1":
          phoneticNatoText += "One ";
          break;
        case "2":
          phoneticNatoText += "Two ";
          break;
        case "3":
          phoneticNatoText += "Three ";
          break;
        case "4":
          phoneticNatoText += "Four ";
          break;
        case "5":
          phoneticNatoText += "Five ";
          break;
        case "6":
          phoneticNatoText += "Six ";
          break;
        case "7":
          phoneticNatoText += "Seven ";
          break;
        case "8":
          phoneticNatoText += "Eight ";
          break;
        case "9":
          phoneticNatoText += "Nine ";
          break;
        case " ":
          phoneticNatoText += "Space ";
          break;
      }
    }

    return phoneticNatoText;
  }