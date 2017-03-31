
const Foo = { template:'#foo' };
const Bar = { template:'#bar' };
const CompaniesList = { template:'#companiesList'};

const routes = [
    { path: '/', redirect: '/foo' },
    { path: '/foo', component: Foo },
    { path: '/bar', component: Bar },
    { path: '/companiesList', component: CompaniesList }
];
const router = new VueRouter({ routes:routes });
const app = new Vue({ router:router }).$mount('#app');
