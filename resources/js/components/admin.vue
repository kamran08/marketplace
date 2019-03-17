<template>
    <div class="andu">

            <!--=========  HEADER  ==========-->
    <header class="app-header navbar">
        <button class="navbar-toggler sidebar-toggler d-lg-none mr-auto" type="button" data-toggle="sidebar-show">
            <span class="navbar-toggler-icon"></span>
        </button>

        <a class="navbar-brand" href="#">
            <img class="navbar-brand-full" src="img/logo.png" alt="CoreUI Logo">
        </a>
        
        <button @click="sideMenuFlagOpen"  class="navbar-toggler sidebar-toggler d-md-down-none" type="button" data-toggle="sidebar-lg-show">
            <span class="navbar-toggler-icon"></span>
        </button>
        <ul class="nav navbar-nav d-md-down-none">
           
            <li class="nav-item px-3">
            <a class="nav-link" href="/">View Website </a>
            </li>
        </ul>

        <ul class="nav navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    <p class="admin_name">{{authInfo.name}}</p>
                </a>
            </li>
            <li class="nav-item">
                <span class="nav-link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    <p class="admin_name"><a href="/logout">Logout</a></p>

                    <img class="img-avatar" src="img/logo.png" alt="admin@bootstrapmaster.com">
                </span>
            </li>
        </ul>
    </header>
            <!--========= HEADER  ==========-->

            <!--========= SIDE MENU  ==========-->
    <div  class="sidebar " :class="(sideMenuFlag == true)? 'openSidebar' : ''">
        <nav class="sidebar-nav">
          <ul class="nav">
            <li class="nav-item">
              <a class="nav-link active" href="index.html">
                <i class="fas fa-tachometer-alt nav-icon"></i> Dashboard
              </a>
            </li>
            <li class="nav-title">Menu</li>

            <li class="nav-item" :class="(memuActiveFlag==1)? 'nav_active' : ''" @click="routerPush(1)" >
                <a class="nav-link"  >
                  <i class="far fa-user nav-icon"></i> User-List
                </a>
            </li>

            <li class="nav-item" :class="(memuActiveFlag==2)? 'nav_active' : ''" @click="routerPush(2)" >
                <a class="nav-link" >
                  <i class="far fa-user nav-icon"></i> Service-List
                </a>
            </li>

            <li class="nav-item" :class="(memuActiveFlag==3)? 'nav_active' : ''" @click="routerPush(3)" >
                <a class="nav-link" >
                  <i class="far fa-user nav-icon"></i> Category-List
                </a>
            </li>
            <li class="nav-item" :class="(memuActiveFlag==4)? 'nav_active' : ''" @click="routerPush(4)" >
                <a class="nav-link" >
                  <i class="far fa-user nav-icon"></i> Waiting-Bookings
                </a>
            </li>
            <li class="nav-item" :class="(memuActiveFlag==5)? 'nav_active' : ''" @click="routerPush(5)" >
                <a class="nav-link" >
                  <i class="far fa-user nav-icon"></i> Running-Bookings
                </a>
            </li>
            <li class="nav-item" :class="(memuActiveFlag==6)? 'nav_active' : ''" @click="routerPush(6)" >
                <a class="nav-link">
                  <i class="far fa-user nav-icon"></i> Completed-Service
                </a>
            </li>
            <li class="nav-item" :class="(memuActiveFlag==7)? 'nav_active' : ''"  @click="routerPush(7)" >
                <a class="nav-link" >
                  <i class="far fa-user nav-icon"></i> Canceled-Bookings
                </a>
            </li>


          </ul>
        </nav>
        <button class="sidebar-minimizer brand-minimizer" type="button"></button>
      </div>
            <!--========= SIDE MENU  ==========-->

            <!--========= CONTENT  ==========-->
        <main class="main" :class="(contentFlag == true)? '' : 'mainContent'">
           <transition name="component-fade" mode="out-in">
                <router-view></router-view>
            </transition>
        </main>
            <!--========= CONTENT  ==========-->

    </div>
</template>

<script>
export default {
    data(){
        return{
            sideMenuFlag:true,
            contentFlag:true,
            memuActiveFlag:1,
            authInfo:{},
        }
    },
    methods:{
        sideMenuFlagOpen(){
            console.log("this is Running!")
            if(this.sideMenuFlag==false)
                this.sideMenuFlag = true
            else this.sideMenuFlag = false

            if(this.contentFlag==false)
                this.contentFlag = true
            else this.contentFlag = false
        },
        routerPush(index){
            if(index==1){
                this.memuActiveFlag = 1
                this.$router.push('/admin');
            }
            else if (index == 2){
                 this.memuActiveFlag = index
                 this.$router.push('/admin/servicelist');
            }
            else if (index == 3){
                 this.memuActiveFlag = index
                  this.$router.push('/admin/category');
            }
            else if (index == 4){
                 this.memuActiveFlag = index
                 this.$router.push('/admin/newbookinglist');
            }
            else if (index == 5){
                 this.memuActiveFlag = index
                 this.$router.push('/admin/bookinglist');
            }
            else if (index == 6){
                 this.memuActiveFlag = index
                 this.$router.push('/admin/completedList');
            }
            else if (index == 7){
                 this.memuActiveFlag = index
                 this.$router.push('/admin/canclebookinglist');
            }

        }
       
    },
    created(){
        this.authInfo = window.authUser
    }
}
</script>


<style>

.component-fade-enter-active, .component-fade-leave-active {
  transition: opacity .5s ease;
}
.component-fade-enter, .component-fade-leave-to
/* .component-fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
.progress-linear {
    
    position: absolute;
    top: -15px;
   
}
</style>