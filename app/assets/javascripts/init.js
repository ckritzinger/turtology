var turtle = null;
var logo = null;
var canvas;
var form;
var sprite;
var textOutput;
var oldcode;
var fast;
var out;
var DelayTurtle;
var cm;

function setup() {
    logo = new Logo();

    fast = 0;
    turtle = new DelayTurtle(canvas, sprite, fast, false);
    logo.setTurtle(turtle);
    logo.setTextOutput(textOutput);
}

function init(canvas_id, turtle_id, form_id, oldcode_id, textoutput_id) {
    canvas = document.getElementById(canvas_id);
    form = document.getElementById(form_id);
    textOutput = document.getElementById(textoutput_id);
    sprite = document.getElementById(turtle_id);

    // I hate opera, I hate firefox.
    canvas.style.width = 500;
    canvas.width = 500;

    canvas.style.height = 500;
    canvas.height = 500;

    oldcode = document.getElementById(oldcode_id);
    setup();
}

function run(speed, drawbits) {
    turtle.stop();
    if (speed !== fast) {
        fast = speed;
        var newturtle = null;
        // newturtle = new Turtle(canvas);

        newturtle = new DelayTurtle(canvas, sprite, fast, drawbits);
        logo.setTurtle(newturtle);
        turtle = newturtle;
    }

    //oldcode.innerHTML += "\n" + form.code.value;
    //form.code.value = ""
    cm.save()
    out = logo.run($('#code').val());

    if (out && out.type === "error") {
        alert(out.data);
        setup();
    }
}

function stop() {
    turtle.stop();
}

function clearcanvas() {
    var ctx = canvas.getContext('2d');
    ctx.fillStyle = "rgb(255,255,255)";
    ctx.fillRect(0, 0, 500, 500);
    textOutput.innerHTML = "";
}

// accommodate Turbolinks
$('.home-draw').ready(function () {
    cm = CodeMirror.fromTextArea(document.getElementById('code'),{
        lineNumbers: true
    });
    init('canvas','turtle','input','oldcode', 'textOutput'); clearcanvas(); run(0,false);
});
