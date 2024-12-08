import DashboardLayout from '../layout/DashboardLayout.vue'
// GeneralViews
import NotFound from '../pages/NotFoundPage.vue'

// Admin pages
import Overview from 'src/pages/Overview.vue'
import UserProfile from 'src/pages/UserProfile.vue'
import TableList from 'src/pages/TableList.vue'
import Typography from 'src/pages/Typography.vue'
import Icons from 'src/pages/Icons.vue'
import Maps from 'src/pages/Maps.vue'
import Notifications from 'src/pages/Notifications.vue'
import Upgrade from 'src/pages/Upgrade.vue'
// Paginas de componentes
import Agencias from 'src/pages/Agencias.vue'
import Departamentos from 'src/pages/Departamentos.vue'
import Areas from '../pages/Areas.vue'
import Categorias from '../pages/Categorias.vue'
import Marcas from '../pages/Marcas.vue'
import Modelos from '../pages/Modelos.vue'
import Monitores from '../pages/Monitores.vue'
import SistemaOperativo from '../pages/SistemaOperativo.vue'
import Procesadores from '../pages/Procesadores.vue'
import DiscoDuro from '../pages/DiscoDuro.vue'
import Ram from '../pages/Ram.vue'
import Antivirus from '../pages/Antivirus.vue'
import Office from '../pages/Office.vue'
import Login from '../Login.vue';
import ModuloControlGeneral from '../pages/ModuloControlGeneral.vue'
import DeptoArea from '../pages/DeptoArea.vue'
import Administradores from '../pages/Administradores.vue'

const routes = [
  {
    path: '/', // Ruta inicial
    redirect: '/login', // Redirige al login
  },
  {
    path: '/login', // Ruta para el login
    name: 'Login',
    component: Login,
  },
  {
    path: '/admin',
    component: DashboardLayout,
    meta: { requiresAuth: true },
    redirect: '/admin/panel',
    children: [
      {
        path: 'panel',
        name: 'panel',
        component: Overview,
        meta: { requiresAuth: true }
      },
      {
        path: 'user',
        name: 'User',
        component: UserProfile,
        meta: { requiresAuth: true }
      },
      {
        path: 'mantenimiento',
        name: 'Mantenimiento',
        component: TableList,
        meta: { requiresAuth: true }
      },
      {
        path: 'equipos',
        name: 'equipos',
        component: Typography
      },
      {
        path: 'datosgenerales',
        name: 'datosgenerales',
        component: Icons,
        meta: { requiresAuth: true }
      },
      {
        path: 'agencias',
        name: 'Agencias',
        component: Agencias,
      },
      {
        path: 'departamentos',
        name: 'Departamentos',
        component: Departamentos,
      },
      {
        path: 'areas',
        name: 'Areas',
        component: Areas,
      },
      {
        path: 'categorias',
        name: 'Categorias',
        component: Categorias,
      },
      {
        path: 'marcas',
        name: 'Marcas',
        component: Marcas,
      },
      {
        path: 'modelos',
        name: 'Modelos',
        component: Modelos,
      },
      {
        path: 'monitores',
        name: 'Monitores',
        component: Monitores,
      },
      {
        path: 'sistemaoperativo',
        name: 'SistemaOperativo',
        component: SistemaOperativo,
      },
      {
        path: 'procesadores',
        name: 'Procesadores',
        component: Procesadores,
      },
      {
        path: 'discoduro',
        name: 'DiscoDuro',
        component: DiscoDuro,
      },
      {
        path: 'ram',
        name: 'Ram',
        component: Ram,
      },
      {
        path: 'antivirus',
        name: 'Antivirus',
        component: Antivirus,
      },
      {
        path: 'office',
        name: 'Office',
        component: Office,
      },
      {
        path: 'administradores',
        name: 'Administradores',
        component: Administradores,
      },
      {
        path: 'deptoarea',
        name: 'DeptoArea',
        component: DeptoArea,
      },
      {
        path: 'admin',
        name: 'admin',
        component: Maps
      },
      {
        path: 'notifications',
        name: 'Notifications',
        component: Notifications
      },
      {
        path: 'upgrade',
        name: 'Upgrade to PRO',
        component: Upgrade
      }
    ]
  },
  { path: '*', component: NotFound }
]

export default routes;
