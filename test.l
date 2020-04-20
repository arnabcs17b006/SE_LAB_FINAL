%{
    #include<iostream>
    #include<stdio.h>
    #include<vector>
    #include<string>
    using namespace std;
    bool declarationFlag=0;
    vector<string> storeVariables;
%}
variable [a-zA-Z][A-Za-z0-9]*
dataType "int"|"float"|"char"
colon ";"
integer [0-9]*
openSquareBracket "["
closeSquareBracket "]"
space " "
%%
{dataType}{space} {
    cout<<yytext;
    declarationFlag=1;
};
{variable}{openSquareBracket}{integer}{closeSquareBracket} {
    cout<<yytext;
    if(declarationFlag){
        storeVariables.push_back(string(yytext));
    }
};
{colon} {
    cout<<yytext<<"\n";
    if(declarationFlag){
        for(auto i:storeVariables){
            int a=i.find("["),b=i.find("]");
            string s=i.substr((int64_t)0,a);
            cout<<"int newVar;\nnewVar="<<s<<"[0];\n"<<s<<"[0]=newVar;";
        }
        storeVariables.clear();
        declarationFlag=0;
    }
};
{space}* {
    cout<<" ";
};
. {
    cout<<yytext;
}
%%

int yywrap(){

}
int main(int argc,char **argv){
    yylex();
}