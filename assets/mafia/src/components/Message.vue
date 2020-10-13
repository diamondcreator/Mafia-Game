<template>
  <div id="message">
    <div id="avatar">
      <div id="img"></div>
      <div id="name">{{ author }}</div>
    </div>
    <div id="ballon" v-bind:class="color || 'orange'">
      {{ text }}
    </div>
  </div>
</template>

<script>
  export default {
    props: ['text','author','color'],
    name: 'Message'
  }
</script>

<style>

    @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@200;400;500&display=swap');
    
    #message{
      width:calc(100% - 40px);
      height: fit-content;
      margin: 20px;
      margin-top: 5px;
      margin-bottom: 0px !important;
      font-family: Raleway;
      display: flex;
    }
    #img{
      width: 60px;
      height: 60px;
      background: #000;
      border: 3px solid #fff;
    }

    #avatar{
      width: 60px;
      height: 100px;
    }
    
    #name{
      text-align: center;
      color: #fff;
      margin-top:5px;
      font-size: 13px;
      font-family: Raleway;
      width: 65px;
    }

    #ballon{
        position: relative;
        width: fit-content;
        max-width: 100%;
        height: fit-content;
        text-align: center;
        color: #fff;
        border: 3px solid #fff;
        margin-left: 35px;
        border-radius: 15px;
        padding: 20px;
        font-weight: 500;
        box-shadow: 0px 4px 10px 1px rgba(0, 0, 0, 0.10);
        animation-duration: 0.2s;
        animation-name: slidein;
    }

    
    @keyframes slidein {
      from {
        padding: 15px;
        left: -20px;
      }

      to {
        padding-left: 20px;
        padding-bottom: 20px; 
        left: 0px;
      }

    }


    #ballon:before,
    #ballon:after {
      content: '    ';
      position: absolute;
      width: 0;
      height: 0;
    }

    #ballon:before {
      left: -25px;
      top: 5px;
      border: 10px solid;
      border-width: 10px 12px 10px 12px;
      border-color:  #fff  #fff transparent transparent;
    }

    .orange{
        background:  linear-gradient(180deg, rgb(253, 209, 78) 0%, rgba(250,204,71,1) 50%, rgba(242,124,20,1) 50%, rgb(194, 109, 34) 100%); 
    }

    .orange:after {
      left: -16px;
      border: 10px solid;
      top: 8px;
      border-width: 7px 9px 7px 9px;
      border-color: #fcd870 #fcd870 transparent transparent;
    }

    .orange{
        background:  linear-gradient(180deg, rgba(250,204,71,1) 50%, rgba(242,124,20,1) 50%, rgb(194, 109, 34) 100%); 
    }

    .orange:after {
      left: -16px;
      border: 10px solid;
      top: 8px;
      border-width: 7px 9px 7px 9px;
      border-color: rgba(250,204,71,1) rgba(250,204,71,1) transparent transparent;
    }

    .grey{
        background:  linear-gradient(180deg, #c1b6b6 50%, #81747b 50%, #796e76 100%); 
    }

    .grey:after {
      left: -16px;
      border: 10px solid;
      top: 8px;
      border-width: 7px 9px 7px 9px;
      border-color: #c1b6b6 #c1b6b6 transparent transparent;
    }

    .blue{
        background:  linear-gradient(180deg, #78abd4 50%, #4474ba 50%, #3f6aad 100%); 
    }

    .blue:after {
      left: -16px;
      border: 10px solid;
      top: 8px;
      border-width: 7px 9px 7px 9px;
      border-color: #78abd4 #78abd4 transparent transparent;
    }

    ::-webkit-scrollbar {
      width: 9px;
      height: 9px;
    }
    ::-webkit-scrollbar-button {
      width: 7px;
      height: 7px;
    }
    ::-webkit-scrollbar-thumb {
      background: #e1e1e1;
      border: 0px none #ffffff;
      border-radius: 79px;
    }
    ::-webkit-scrollbar-thumb:hover {
      background: #ffffff;
    }
    ::-webkit-scrollbar-thumb:active {
      background: #000000;
    }
    ::-webkit-scrollbar-track {
      background: #666666;
      border: 0px none #ffffff;
      border-radius: 75px;
    }
    ::-webkit-scrollbar-track:hover {
      background: #666666;
    }
    ::-webkit-scrollbar-track:active {
      background: #333333;
    }
    ::-webkit-scrollbar-corner {
      background: transparent;
    }

</style>
