export default {
  mounted() {
    const currentColorMode = $("html").attr("data-bs-theme");

    if (currentColorMode === "dark") {
      $(".dot").css("background", "#ffffff");
    } else {
      $(".dot").css("background", "#000000");
    }
  },
};
