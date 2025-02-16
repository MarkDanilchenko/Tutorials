export default {
  mounted() {
    const colorMode = localStorage.getItem("colorMode");

    if (colorMode === "light") {
      $("#colorMode_switcher").attr("checked", false);
    } else if (colorMode === "dark") {
      $("#colorMode_switcher").attr("checked", true);
    }
  },
};
