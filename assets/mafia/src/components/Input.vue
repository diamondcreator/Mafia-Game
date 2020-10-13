<template>
  <input class="info-input">
</template>

<script>
  export default {
    name: 'InfoInput'
  }
</script>

<style>
    .info-input {
        width: 250px;
        height: 5px;
        background: #141414;
        border-radius: 10px;
        border: 0px;
        padding: 20px;
        color: #fff;
        outline: none;
        margin-bottom: 20px;
    }

    .overlay {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0px;
        left:0px;
        border-radius: 40px;
        outline: none;
        transition: 0.2s background;
    }


    .overlay:hover {
        background-color:rgba(255, 255, 255, 0.159);
    }
</style>
