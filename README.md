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
aFileStream.pipe(funs.reduce( function (total, chunk) { total += chunk.match(/o/g).length; }))
             .pipe(funs.map( function (total) { return " total amoun of 'o': " + total; }))
             .pipe(process.stdout);
```


# RangeStream

Creates an stream that emits a data event for every number in the range, then ends

```js
funs.range(1, 100).pipe(process.stdout);
```

# DelayStream

The stream emits the data event after an specific amount of milliswcond for every input.

```js
funs.range(1, 100).pipe(funs.delay(100)).pipe(process.stdout);
```


# SerialStream

Receive N input streams and produce a new one that maps the data event of the inputs in a serial way. After an input emits the end event it start reading and maping the data event of the next input. After the last stream ends the result stream ends.

```js
funs.serial(fs.readDir().map(function (f) { return fs.createReadStream(f); })
    .pipe(tar)
    .pipe(gz);
```