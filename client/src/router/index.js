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
		component: () => import('@/pages/NewTutorial__page.vue'),
	},
	{
		path: '/tutorials/update/:id',
		name: 'update',
		component: () => import('@/pages/UpdateTutorial__page.vue'),
	},
	{
		path: '/signup',
		name: 'signup',
		component: () => import('@/pages/SignUp__page.vue'),
	},
	{
		path: '/signin',
		name: 'signin',
		component: () => import('@/pages/SignIn__page.vue'),
	},
	{
		path: '/:pathMatch(.*)*',
		name: 'notFound',
		component: () => import('@/pages/NotFound__page.vue'),
	},
];

const router = VueRouter.createRouter({
	history: VueRouter.createWebHistory(),
	routes,
});

export default router;
