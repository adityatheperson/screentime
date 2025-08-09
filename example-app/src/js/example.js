import { screentime } from 'screentime';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    screentime.echo({ value: inputValue })
}
