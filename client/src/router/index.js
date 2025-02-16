import * as VueRouter from "vue-router";

const routes = [
  {
    path: "/",
    name: "home",
    component: () => import("@/pages/Home.vue"),
  },
  {
    path: "/signup",
    name: "signup",
    component: () => import("@/pages/Auth/SignUp.vue"),
  },
  {
    path: "/signin",
    name: "signin",
    component: () => import("@/pages/Auth/SignIn.vue"),
  },
  {
    path: "/tutorials",
    name: "tutorials",
    component: () => import("@/pages/Tutorials/Tutorials.vue"),
  },
  {
    path: "/tutorials/create",
    name: "TutorialCreate",
    component: () => import("@/pages/Tutorials/TutorialCreate.vue"),
  },
  {
    path: "/tutorials/update/:id",
    name: "TutorialUpdate",
    component: () => import("@/pages/Tutorials/TutorialUpdate.vue"),
  },
  {
    path: "/:pathMatch(.*)*",
    name: "notFound",
    component: () => import("@/pages/NotFound.vue"),
  },
];

const router = VueRouter.createRouter({
  history: VueRouter.createWebHistory(),
  routes,
});

export default router;
