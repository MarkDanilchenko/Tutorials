export default {
  mounted() {
    const colorMode = $("html").attr("data-bs-theme");

    if (colorMode === "light") {
      $("#colorMode_switcher").attr("checked", false);
    } else if (colorMode === "dark") {
      $("#colorMode_switcher").attr("checked", true);
    }
  },
};
