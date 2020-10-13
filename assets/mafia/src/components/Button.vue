<template>
  <button
    class="button"
    v-bind:style="{
      width: width || '220px',
      background:
        'linear-gradient(180deg, ' +
        (color || '#872525') +
        ' 50%, ' +
        (dark_color || '#6D2020') +
        ' 50%)',
    }"
  >
    <div class="overlay"></div>
    {{ text }}
  </button>
</template>

<script>
export default {
  props: ["text", "color", "dark_color", "width"],
  name: "b-button",
};
</script>

<style>
.button {
  height: 50px;
  border: 6px solid #fff;
  cursor: pointer;
  box-shadow: 0px 4px 10px 2px rgba(0, 0, 0, 0.25);
  border-radius: 40px;
  outline: none;
  color: #fff;
  font-family: "Lato", sans-serif;
  font-size: 16px;
  position: relative;
  margin-bottom: 20px;
}

.overlay {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0px;
  left: 0px;
  border-radius: 40px;
  outline: none;
  transition: 0.2s background;
}

.overlay:hover {
  background-color: rgba(255, 255, 255, 0.159);
}
</style>
