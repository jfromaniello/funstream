var coffee = require("coffee-script"),
    RangeStream = require('../lib/range-stream'),
    myRange = new RangeStream(1, 10);

myRange.pipe(process.stdout, {end: false});

myRange.resume();

/*print a new line*/
console.log();