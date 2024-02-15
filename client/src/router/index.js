import * as VueRouter from 'vue-router';

const routes = [
	{
		path: '/',
		name: 'home',
		component: () => import('@/pages/Home__page.vue'),
	},
	{
		path: '/tutorials',
		name: 'tutorials',
		component: () => import('@/pages/Tutorials__page.vue'),
	},
	{
		path: '/tutorials/addNew',
		name: 'addNew',
		component: () => import('@/pages/AddNew__page.vue'),
	},
];

const router = VueRouter.createRouter({
	history: VueRouter.createWebHistory(),
	routes,
});

export default router;
