const btnNear = document.querySelector("#btn-near"),
spotNear = document.querySelector(".spot-near"),
close = document.querySelector("#close"),
child = document.querySelector(".open-close")
btnNear.addEventListener("click", ()=>{
    if (spotNear.classList.contains("active")) {
        console.log('close')
        child.innerText = "Near Me"
    } else {
        child.innerText = "Close"
    }
    spotNear.classList.toggle("active")
})
     
