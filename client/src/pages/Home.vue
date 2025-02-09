<template>
  <section class="my-home">
    <router-link to="/tutorials" class="nav-link" alt="Home page" title="Home page">
      <div class="d-flex flex-column align-items-center justify-content-center">
        <!-- spinner-dots animation -->
        <div class="text-center lead">
          <div class="mod">
            <div class="cube">
              <div class="faces f1">
                <div class="dot p1"></div>
                <div class="dot p2"></div>
                <div class="dot p3"></div>
                <div class="dot p4"></div>
                <div class="dot p5"></div>
                <div class="dot p6"></div>
                <div class="dot p7"></div>
                <div class="dot p8"></div>
                <div class="dot p9"></div>
              </div>
              <div class="faces f2">
                <div class="dot p10"></div>
                <div class="dot p11"></div>
                <div class="dot p12"></div>
                <div class="dot p13"></div>
              </div>
              <div class="faces f3">
                <div class="dot p1"></div>
                <div class="dot p2"></div>
                <div class="dot p3"></div>
                <div class="dot p4"></div>
                <div class="dot p5"></div>
                <div class="dot p6"></div>
                <div class="dot p7"></div>
                <div class="dot p8"></div>
                <div class="dot p9"></div>
              </div>
              <div class="faces f4">
                <div class="dot p10"></div>
                <div class="dot p11"></div>
                <div class="dot p12"></div>
                <div class="dot p13"></div>
              </div>
              <div class="faces f5">
                <div class="dot p1"></div>
                <div class="dot p2"></div>
                <div class="dot p3"></div>
                <div class="dot p4"></div>
                <div class="dot p5"></div>
                <div class="dot p6"></div>
                <div class="dot p7"></div>
                <div class="dot p8"></div>
                <div class="dot p9"></div>
              </div>
              <div class="faces f6">
                <div class="dot p10"></div>
                <div class="dot p11"></div>
                <div class="dot p12"></div>
                <div class="dot p13"></div>
              </div>
              <div class="faces f7">
                <div class="dot p1"></div>
                <div class="dot p2"></div>
                <div class="dot p3"></div>
                <div class="dot p4"></div>
                <div class="dot p5"></div>
                <div class="dot p6"></div>
                <div class="dot p7"></div>
                <div class="dot p8"></div>
                <div class="dot p9"></div>
              </div>
              <div class="faces f8">
                <div class="dot p10"></div>
                <div class="dot p11"></div>
                <div class="dot p12"></div>
                <div class="dot p13"></div>
              </div>
              <div class="faces f9">
                <div class="dot p1"></div>
                <div class="dot p2"></div>
                <div class="dot p3"></div>
                <div class="dot p4"></div>
                <div class="dot p5"></div>
                <div class="dot p6"></div>
                <div class="dot p7"></div>
                <div class="dot p8"></div>
                <div class="dot p9"></div>
              </div>
              <div class="faces f10">
                <div class="dot p10"></div>
                <div class="dot p11"></div>
                <div class="dot p12"></div>
                <div class="dot p13"></div>
              </div>
              <div class="faces f11">
                <div class="dot p1"></div>
                <div class="dot p2"></div>
                <div class="dot p3"></div>
                <div class="dot p4"></div>
                <div class="dot p5"></div>
                <div class="dot p6"></div>
                <div class="dot p7"></div>
                <div class="dot p8"></div>
                <div class="dot p9"></div>
              </div>
            </div>
            <div class="project-name">
              <p>
                <span class="text-green">Click &#128433;</span> <br />
                to show the Tutorials
              </p>
            </div>
          </div>
        </div>
      </div>
    </router-link>
  </section>
</template>

<script>
import dotInit from "@/mixins/dotsInit.js";

export default {
  name: "Home",
  mixins: [dotInit],
};
</script>

<style scoped lang="scss">
p {
  font-size: 25px;
  line-height: 1.5;

  span {
    font-size: 50px;
  }
}
</style>
