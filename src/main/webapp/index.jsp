<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@500&display=swap"
      rel="stylesheet"
    />
    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<style>
ul {
    margin: 0px;
    padding: 0px;
}
.footer-widget ul li {
  display: inline-block;
  float: left;
  width: 50%;
  margin-bottom: 12px;
}
 .footer-widget-2{
	display: inline-block;
  float: left;
  width: 100%;
  margin-bottom: 12px;
}
.footer-widget ul li a:hover{
  color: #ff5e14;
}
.footer-widget ul li a {
  color: #878787;
  text-transform: capitalize;
}


* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
body {
  height: 100vh;
  background: linear-gradient(135deg, #8052ec, #d161ff);
}
.container {
  width: 32em;
  background-color: #ffffff;
  padding: 5em;
  border-radius: 0.6em;
  position: absolute;
  transform: translate(-50%, -50%);
  top: 50%;
  left: 50%;
  box-shadow: 0 1em 2em rgba(0, 0, 0, 0.25);
}
.wrapper {
  display: flex;
  align-content: center;
  justify-content: space-between;
  margin: 1em 0;
}
canvas {
  border: 1px solid #000000;
  border-radius: 0.4em;
}
button#reload-button {
  font-size: 26px;
  width: 4.6em;
  background-color: #8052ec;
  border: none;
  border-radius: 0.4em;
  color: #ffffff;
}
input[type="text"] {
  font-family: "Roboto Mono", monospace;
  font-size: 1.05em;
  width: 100%;
  padding: 1em 0.7em;
  border: 1px solid #000000;
  border-radius: 0.4em;
}
button#submit-button {
  width: 100%;
  background-color: #8052ec;
  color: #ffffff;
  font-size: 1.5em;
  border: none;
  margin-top: 1em;
  padding: 0.8em 0;
  border-radius: 0.4em;
  font-family: "Roboto Mono", monospace;
}

</style>
<script type="text/javascript">
//Initial References
let submitButton = document.getElementById("submit-button");
let userInput = document.getElementById("user-input");
let canvas = document.getElementById("canvas");
let reloadButton = document.getElementById("reload-button");
let text = "";

//Generate Text
const textGenerator = () => {
  let generatedText = "";
  /* String.fromCharCode gives ASCII value from a given number */
  // total 9 letters hence loop of 3
  for (let i = 0; i < 3; i++) {
    //65-90 numbers are capital letters
    generatedText += String.fromCharCode(randomNumber(65, 90));
    //97-122 are small letters
    generatedText += String.fromCharCode(randomNumber(97, 122));
    //48-57 are numbers from 0-9
    generatedText += String.fromCharCode(randomNumber(48, 57));
  }
  return generatedText;
};

//Generate random numbers between a given range
const randomNumber = (min, max) =>
  Math.floor(Math.random() * (max - min + 1) + min);

//Canvas part
function drawStringOnCanvas(string) {
  //The getContext() function returns the drawing context that has all the drawing properties and functions needed to draw on canvas
  let ctx = canvas.getContext("2d");
  //clear canvas
  ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
  //array of text color
  const textColors = ["rgb(0,0,0)", "rgb(130,130,130)"];
  //space between letters
  const letterSpace = 150 / string.length;
  //loop through string
  for (let i = 0; i < string.length; i++) {
    //Define initial space on X axis
    const xInitialSpace = 25;
    //Set font for canvas element
    ctx.font = "20px Roboto Mono";
    //set text color
    ctx.fillStyle = textColors[randomNumber(0, 1)];
    ctx.fillText(
      string[i],
      xInitialSpace + i * letterSpace,
      randomNumber(25, 40),
      100
    );
  }
}

//Initial Function
function triggerFunction() {
  //clear Input
  userInput.value = "";
  text = textGenerator();
  console.log(text);
  //Randomize the text so that everytime the position of numbers and small letters is random
  text = [...text].sort(() => Math.random() - 0.5).join("");
  drawStringOnCanvas(text);
}

//call triggerFunction for reload button
reloadButton.addEventListener("click", triggerFunction);

//call triggerFunction when page loads
window.onload = () => triggerFunction();

//When user clicks on submit
submitButton.addEventListener("click", () => {
  //check if user input  == generated text
  if (userInput.value === text) {
    alert("Success");
  } else {
    alert("Incorrect");
    triggerFunction();
  }
});
</script>

HTML CSSResult Skip Results Iframe
EDIT ON


                        <div class="footer-widget">
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">about</a></li>
                            </ul>
                            <ul>
                                <li><a href="#">Hodn me</a></li>
                            </ul>
                        </div>
                        <div class="footer-widget-2">

                            <ul>
                                <li><a href="#">Hodvkyujkyjvkmnbdcgs,hvcsvcnnn me</a></li>
                            </ul>
                        </div>
                    
       <div class="container">
      <div class="wrapper">
        <canvas id="canvas" width="200" height="70"></canvas>
        <button id="reload-button">
          <i class="fa-solid fa-arrow-rotate-right"></i>
        </button>
      </div>
      <input
        type="text"
        id="user-input"
        placeholder="Enter the text in the image"
      />
      <button id="submit-button">Submit</button>
    </div>      
                    
               

</body>
</html>