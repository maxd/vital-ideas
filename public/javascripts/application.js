function rgb2hex(str) {
    if (str[0] == "#")
        return str;

    function hex(x) {
        hexDigits = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8","9", "A", "B", "C", "D", "E", "F");
        return isNaN(x) ? "00" : hexDigits[(x - x % 16) / 16] + hexDigits[x % 16];
    }
    
    var rgb = str.match(/\d+/g);
    return "#" + hex(rgb[0]) + hex(rgb[1]) + hex(rgb[2]);
}