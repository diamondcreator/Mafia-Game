const auth = (to, from, next) => {
    //logica de login
    const a = 1;

    if(a == 1){
        next()
    }
    next(false)
}


export default auth