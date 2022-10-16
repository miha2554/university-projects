#include <iostream>
#include <algorithm>
#include <vector>
#include <sstream>
#include <iterator>
#include <unordered_map>


std::string getChoice();
std::vector<std::string> getCoords();


int main() {
    setlocale(LC_ALL, "Russian");
    std::string choice = getChoice();

    if (choice == "e") {
        std::cout << "Input string: ";
        std::string input;
        std::getline(std::cin, input);
        input.erase(remove_if(input.begin(), input.end(), isspace), input.end());

        std::unordered_map<char, unsigned int> alphaToInt = {
            {'а', 11},
            {'б', 21},
            {'в', 31},
            {'г', 41},
            {'д', 51},
            {'е', 61},
            {'ж', 12},
            {'з', 22},
            {'и', 32},
            {'к', 42},
            {'л', 52},
            {'м', 62},
            {'н', 13},
            {'O', 23},
            {'п', 33},
            {'р', 43},
            {'с', 53},
            {'т', 63},
            {'у', 14},
            {'ф', 24},
            {'х', 34},
            {'ц', 44},
            {'ч', 54},
            {'ш', 64},
            {'щ', 15},
            {'ь', 25},
            {'ы', 35},
            {'э', 45},
            {'ю', 55},
            {'я', 65},
        };

        for (int i = 0; i < input.length(); i++) {
            std::cout << alphaToInt[input[i]] << ' ';
        }
    }
    else {
        std::vector<std::string> coords = getCoords();
        std::string output;

        const std::string squareIJ[5][6] = {
                            {"А", "Б", "В", "Г", "Д", "Е"},
                            {"Ж", "З", "И", "К", "Л", "М"},
                            {"Н", "О", "П", "Р", "С", "Т"},
                            {"У", "Ф", "Х", "Ц", "Ч", "Ш"},
                            {"Щ", "Ь", "ы", "Э", "Ю", "Я"},
        };

        for (int i = 0; i < coords.size(); ++i) {
            std::string coord = coords[i];
            output.append(squareIJ[coord[1] - '1'][coord[0] - '1']);
        }

        std::cout << output;

    }

    std::cout << '\n';
    return 0;
}

std::string getChoice() {
    std::string choice;
    do {
        std::cout << "Encrypt or decrypt [e/d] = ";
        std::getline(std::cin, choice);
        if (choice == "E") choice = "e";
        std::transform(choice.begin(), choice.end(), choice.begin(), ::tolower);
    } while (choice != "e" && choice != "d");

    return choice;
}

std::vector<std::string> getCoords() {
    std::cout << "Координаты: ";
    std::string strCoords;
    std::getline(std::cin, strCoords);
    std::stringstream streamCoords(strCoords);
    std::istream_iterator<std::string> begin(streamCoords);
    std::istream_iterator<std::string> end;
    std::vector<std::string> coords(begin, end);
    return coords;
}