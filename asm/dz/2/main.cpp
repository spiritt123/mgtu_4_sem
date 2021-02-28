#include <iostream>
#include <algorithm>
#include <string>

bool id(std::string &str);
bool mult(std::string &str);
bool term(std::string &str);
bool culc(std::string &str);

int main()
{
    std::string str;
    std::cout << "Input math string: ";
    getline(std::cin, str, '\n');
    bool answer = true;
    str.erase(remove_if(str.begin(), str.end(), isspace), str.end());
    while (str.length() > 0 && answer)
    {
        answer = culc(str);
        if (answer && str.length() == 0)
            std::cout << "Yes";
        else 
            std::cout << "No";
        std::cout << "\n\nInput math string: ";
        getline(std::cin, str, '\n');
        str.erase(remove_if(str.begin(), str.end(), isspace), str.end());
        answer = true;
    }

    return 0;
}

bool id(std::string &str)
{
    int state[7][5] = {
    //-  1  .  e  an
/*0*/ 1, 1,-1,-1,-2,
/*1*/ 9, 1, 2,-1, 9,
/*2*/-1, 3,-1,-1,-2,
/*3*/ 9, 3,-1, 4, 9,
/*4*/ 5,-1,-1,-1,-2,
/*5*/-1, 6,-1,-1,-2,
/*6*/-1, 6,-1,-1, 9
    };
    int state_now = 0;
    
    std::string s;
    int col = 0;
    while ((state_now >= 0) && (state_now != 9) && (str.length() != 0))
    {
        if (str[0] == '-' || str[0] == '+') col = 0;
        else if (str[0] >= '0' && str[0] <= '9') col = 1;
        else if (str[0] == '.') col = 2;
        else if (str[0] == 'E') col = 3;
        else col = 4;

        state_now = state[state_now][col];
        if (state_now != -1 && state_now != 9)
        {
            s += str[0];
            str.erase(0, 1);
        }
    }
    if (str.length() == 0 && (state_now == 6 || state_now == 3)) 
        state_now = 9;
    if (state_now == 9 && s.length() != 0)
    {
        std::cout << "Identify = " << s << "\n";
        return true;
    }
    else
    {
        if (state_now == -2)
        {
            if (str[0] == '+' || str[0] == '-' || 
                str[0] == '(' || str[0] == ')' || 
                str[0] == '*' || str[0] == '/')
            {
                std::cout << "Identify = " << s << "\n";
                return true;
            }
        }
        if (state_now == -1)
        {
            std::cout << "Wrong symbol *" << str[0] << "*\n";
        }
        else
        {
            std::cout << "Identifier waits..." << str << "\n";
        }
        return false;
    }

    return true;
}


bool mult(std::string &str)
{
    bool answer = false;
    if (str[0] == '(')
    {
        str.erase(0, 1);
        answer = culc(str);
        if (answer && str[0] == ')')
            str.erase(0, 1);
        else
            std::cout << "error: " << str << "\n";
    }
    else answer = id(str);
    return answer;
}

bool term(std::string &str)
{
    bool answer = false;
    answer = mult(str);
    if (answer)
    {
        while ((str[0] == '*' || str[0] == '/') && answer)
        {
            str.erase(0, 1);
            answer = mult(str);
        }
    }
    return answer;
}

bool culc(std::string &str)
{
    bool answer = false;
    answer = term(str);
    if (answer)
    {
        while ((str[0] == '+' || str[0] == '-') && answer)
        {
            str.erase(0, 1);
            answer = term(str);
        }
    }
    return answer;
}
