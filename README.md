
Started this to learn about node streams and becuase I thought it was cool.

# FilterStream

The callback receives a chunk and has to return true or falsy. If it returns true, the result stream will emit the data event for this chunk. 

```js
process.stdin.resume();
process.stdin.pipe(funs.filter(function (chunk) { return chunk.length > 5; }))
             .pipe(process.stdout);
```

# MapStream

Allows to pipe a conversion of the chunks. 

```js
process.stdin.resume();
process.stdin.pipe(funs.map(function (chunk) { return "she said: " + chunk; }))
             .pipe(process.stdout);
```


# ReduceStream

Execute the callback, accumulating in the seed, when the source stream ends emit a data event with the result and end the stream.

```js
var aFileStream = fs.createReadStream("foo.txt");
process.stdin.pipe(funs.reduce( function (total, chunk) { total += chunk.match(/o/g).length; }))
             .pipe(funs.map( function (total) { return " total amoun of 'o': " + total; }))
             .pipe(process.stdout);
```