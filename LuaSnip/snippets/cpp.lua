local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
    s("cpt", {
        t({
            "/*",
            " * Problem: [Contest + Problem Name]",
            " * Link: [Direct problem link]",
            " * Difficulty: [Your assessment]",
            " * ",
            " * Solution Approach: [Brief explanation]",
            " * Time/Space Complexity: [Analysis]",
            " */",
            "#include <iostream>",
            "#include <vector>",
            "#include <utility>",
            "#include <unordered_map>",
            "#include <unordered_set>",
            "using namespace std;",
            "",
            "// Useful typedefs",
            "typedef long long ll;",
            "typedef vector<int> vi;",
            "typedef vector<ll> vll;",
            "typedef pair<int, int> pii;",
            "typedef pair<ll, ll> pll;",
            "",
            "// Useful macros",
            "#define pb push_back",
            "#define mp make_pair",
            "#define fi first",
            "#define se second",
            "#define sz(x) ((int)(x).size())",
            "#define all(x) (x).begin(), (x).end()",
            "#define rep(i, a, b) for (int i = a; i < b; i++)",
            "#define per(i, a, b) for (int i = a; i >= b; i--)",
            "#define umap unordered_map",
            "#define uset unordered_set",
            "",
            "// Fast I/O",
            "#define fast_io ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);",
            "",
            "// Debug macro (remove for submission)",
            "#ifdef LOCAL",
            "#define debug(x) cout << #x << \" = \" << x << endl;",
            "#else",
            "#define debug(...)",
            "#endif",
            "",
            "int main() {",
            "    fast_io;",
            ""
        }),
        i(0),
        t({
            "",
            "    return 0;",
            "}"
        }),
    }),
})
