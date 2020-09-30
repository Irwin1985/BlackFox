# BlackFox ![](docs/prg.gif)  

**BlackFox** is a tiny Visual FoxPro like grammar that abstracts some verbose code for modern language constructs like JSON notation, HTTP protocol and so forth.

### Project Manager

**Irwin Rodríguez** (Toledo, Spain)

### Latest Release

**[BlackFox]** - 1.0 - Beta Release 2020-09-30 20:44:08


<hr>

### Dependencies

**JSONFox** Application library for JSON related operations.

**FoxThread** Application library for Multithreading (Not yet implemented).

### Examples
```xBase
 Do LocFile("BlackFox", "app")

// JSON Examples 
// 1. Create JSON object from String literal.
Local lcJSONString
lcJSONString = '{"foo": "bar"}'
TEXT TO _vfp.BlackFox NOSHOW TEXTMERGE PRETEXT 7
  # This is a full line comment.
  CREATE JSON OBJECT MyObj FROM '<<lcJSONString>>'
ENDTEXT
?MyObj.foo 

// 2. Create JSON object from file.
TEXT TO _vfp.BlackFox NOSHOW TEXTMERGE PRETEXT 7
  CREATE JSON OBJECT MyObj FROM FILE 'c:\path\to\my\file.json'
ENDTEXT

// 3. Create JSON object from cursor.
Create Cursor cGames (game c(25), launched i(4))
Insert into cGames Values('Pac-Man', 1980)
Insert into cGames Values('Super Mario Bros', 1985)
Insert into cGames Values('Space Invaders', 1978)
Insert into cGames Values('The Legend of Zelda', 1986)

TEXT TO _vfp.BlackFox NOSHOW TEXTMERGE PRETEXT 7
  CREATE JSON OBJECT MyObj FROM CURSOR cGames
ENDTEXT
?Myobj.cGames[1].game
?Myobj.cGames[1].launched

// 4. Create JSON object from variable.
Local lcJSONString
lcJSONString = '{"foo": "bar"}'
TEXT TO _vfp.BlackFox NOSHOW TEXTMERGE PRETEXT 7
  CREATE JSON OBJECT MyObj FROM lcJSONString
ENDTEXT
?MyObj.foo

// PRINT COMMAND
TEXT TO _vfp.BlackFox NOSHOW TEXTMERGE PRETEXT 7
  # Create JSON Object
  CREATE JSON OBJECT MyObj FROM FILE 'c:\path\to\my\file.json'

  # PRINT JSON OBJECT.
  PRINT JSON OBJECT MyOBJ TO MyVar
ENDTEXT
?MyVar

// Printing in screen
TEXT TO _vfp.BlackFox NOSHOW TEXTMERGE PRETEXT 7
  # Create JSON Object
  CREATE JSON OBJECT MyObj FROM FILE 'c:\path\to\my\file.json'

  # PRINT JSON OBJECT.
  PRINT JSON OBJECT MyOBJ IN SCREEN
ENDTEXT

// HTTP REQUEST COMMANDS
// 1. GET Request
TEXT TO _vfp.BlackFox NOSHOW TEXTMERGE PRETEXT 7
  # SEND HTTP USING GET METHOD
  HTTP GET MyHTTP 
    URL 'https://jsonplaceholder.typicode.com/todos/1'
    ADD HEADER 'Content-Type' with 'application/json'
ENDTEXT
?MyHTTP.responseText

// 2. POST Request
Local lcBody
Text to lcBody noshow
  {
    "Id": 78912,
    "Customer": "Jason Sweet",
    "Quantity": 1,
    "Price": 18.00
  }
endtext
TEXT TO _vfp.BlackFox NOSHOW TEXTMERGE PRETEXT 7
  # SEND HTTP USING POST METHOD
  HTTP POST MyHTTP 
    URL 'https://reqbin.com/echo/post/json'
	BODY '<<lcBody>>'
	ADD HEADER 'Content-Type' with 'application/json'	
ENDTEXT
?MyHTTP.responseText

```

<hr>

### Release History

<hr>

2020-09-30

* Beta Release


## License

`JSONFox` is released under the MIT Licence.
