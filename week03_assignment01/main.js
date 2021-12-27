const ps=require("prompt-sync");
const prompt =ps();
const greetingMessage=require('./greet');
function main(){
    let name=prompt("enetr choice");
    //console.log(name);
    greetingMessage(name);

}

main();