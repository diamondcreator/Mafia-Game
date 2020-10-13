<template>
  <div id="room" style="display:flex;">
    <div id="players">

    </div>
    <div id="chat">
        <div id="message-box">
            <div  v-for="(item) in items" v-bind:key="item.id">
                <message v-if="!item.system" v-bind:author="item.author" v-bind:text="item.text" v-bind:color="item.color"></message>
                <system-message v-bind:text="item.text" v-if="item.system"></system-message>
            </div>
        </div>
        <input id="chat-input">
    </div>
  </div>
</template>

<script>

  import Message from '../components/Message.vue'

  import SystemMessage from '../components/SystemMessage.vue'

    let obj = {items: [
            {id: 0, system: true, text: "Okaabe foi encontrado morto no telhado"},
        ]}

  export default {
    name: 'Home',
    components: {
      'message': Message,
      'system-message': SystemMessage
    },
    data: function(){
        return obj
    }
  }

  let phrases = [" I was wondering if you need any help on your new project.", " Sure! That would be great! Are you good at writing or would you rather do the computer work?", " I would like to help with the computer work.", " Great! We are going to be working in teams of three. Are you OK working with others?", " Yes, I like working like that.", " We will begin next Monday. Would you be available then?", " Yes, I can be there.", " Well, if you could send me your basic background …formation before next Monday, it would be useful.", " I will send the information to you.", " Well then, thanks for your help. Have a great day!"]
  let authors = ["Spinoza","Marx","Nietzsche","Camus","Dijkstra","Ookabe","Acnologia"]
  let id = 1;

  setInterval(() => {
      let n = Math.random();
      obj.items.push({id: id++, text: phrases[Math.floor(n*phrases.length)], author: authors[Math.floor(n*authors.length)], system: false, color: ['blue','grey','orange'][Math.floor(n*3)]})
  }, 2000);

</script>

<style>

  @import url('https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap');

  body {
    background: #1A1A1A;
  }

  #chat-input {
      width: calc(100% - 110px);
      padding: 15px;
      background: #151515;
      border-radius: 15px;
      border: none;
      
  }

  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
  }

  #players{
      background: #171717;
      width: 250px;
      height: 100vh;
  }

  #message-box{
      width: 100%;
      height: calc(100% - 110px);
      width: calc(100% - 40px);
      margin:20px;  
        overflow-y: auto;
        display: flex;
        flex-flow: column nowrap;
  }

  #message-box  > :first-child {
      margin-top: auto !important;
  }

  #chat{
      width: calc(100% - 250px);
      height: 100vh;
  }

</style>
