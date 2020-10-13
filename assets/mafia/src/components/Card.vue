<template>
  <div class="card">
    <div class="subcard" style="background-color: #1b1b1b">
      <div id="centered">
        <div class="title">ENTER AS GUEST</div>
        <info-input placeholder="Name"></info-input>
        <info-input placeholder="Login"></info-input>
        <info-input placeholder="Password"></info-input>
        <b-button text="Registrar"></b-button>
      </div>
    </div>
    <div class="subcard">
      <div id="centered">
        <div class="title">LOGIN</div>
        <info-input placeholder="Login"></info-input>
        <info-input placeholder="Password"></info-input>
        <b-button text="LOGIN"></b-button>
        <hr
          style="width: 90%; border: 1px solid #3d3d3d; margin-bottom: 40px"
        />
        <b-button
          text="DISCORD"
          width="180px"
          color="#579BDB"
          dark_color="#3D6F9D"
        ></b-button>
        <b-button
          text="GITHUB"
          width="180px"
          color="#2E2E2E"
          dark_color="#181818"
        ></b-button>
      </div>
    </div>
  </div>
</template>

<script>
import Button from "../components/Button.vue";
import Input from "../components/Input.vue";

export default {
  name: "card",
  components: {
    "b-button": Button,
    "info-input": Input,
  },
};
</script>

<style>
.title {
  color: #fff;
  font-size: 40px;
  margin: 20px;
  font-family: "Lato", sans-serif;
}

.text {
  color: #494949;
  margin: 20px;
}

#centered {
  transform: translate(-50%, -50%);
  left: 50%;
  top: 50%;
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.card {
  position: absolute;
  width: 70%;
  height: 80%;
  transform: translate(-50%, -50%);
  left: 50%;
  top: 50%;
  filter: drop-shadow(0px 4px 20px rgba(0, 0, 0, 0.25));
  background: #1e1e1e;
  display: inline-flex;
}

.subcard {
  width: 50%;
  height: 100%;
  min-width: 300px;
  display: block !important;
}

@media only screen and (max-width: 1030px) and (max-height: 550px) {
  .card {
    transform: translate(-50%, 0%);
    top: 50px;
    display: block !important;
    height: fit-content !important;
    width: 50vw;
  }

  .subcard {
    top: 0px !important;
    width: 50vw !important;
    height: 600px !important;
  }
}
</style>
