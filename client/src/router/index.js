import * as VueRouter from 'vue-router';

const routes = [
	{
		path: '/',
		name: 'main',
		component: () => import('@/pages/Main__page.vue'),
	},
	{
		path: '/tutorials',
		name: 'tutorials',
		component: () => import('@/pages/Tutorials__page.vue'),
	},
	{
		path: '/tutorials/:id',
		name: 'tutorial',
		component: () => import('@/pages/Tutorial__page.vue'),
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
