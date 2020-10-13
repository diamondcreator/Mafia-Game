<template>
  <div id="system-message">▷▷ {{ text }}</div>
</template>

<script>
export default {
  props: ["text"],
  name: "SystemMessage",
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Raleway:wght@200;400&display=swap");

#system-message {
  width: calc(100% - 40px);
  text-align: center;
  margin: 20px;
  font-family: Raleway;
  color: #fff;
  font-weight: 200;
}
</style>
