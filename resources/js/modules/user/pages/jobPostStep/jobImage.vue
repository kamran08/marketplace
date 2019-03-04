<template>
    <div class="_login_input_group">
        <div class="_1steps_img _1steps_shadow">
            <img class="_1steps_img_pic" src="img/V90.jpg"  title="">
        </div>
        <div class="_1steps_img_select">
            <ul class="_1steps_img_select_pic">
                <li class="_1steps_shadow">
                    <img src="img/V90.jpg"  title="">
                    <p class="_1steps_cencel _1steps_shadow">
                       <i class="fas fa-plus"></i>
                    </p>
                </li>
                 <li class="_1steps_shadow _1steps_img_select_active">
                    <img src="img/V90.jpg"  title="">
                    <p class="_1steps_cencel _1steps_shadow">
                       <i class="fas fa-plus"></i>
                    </p>
                </li>
                 <li class="_1steps_shadow">
                    <img src="img/V90.jpg"  title="">
                    <p class="_1steps_cencel _1steps_shadow">
                       <i class="fas fa-plus"></i>
                    </p>
                </li>
                <li class="_1steps_add">
                    <i class="fas fa-plus"></i>
                </li>
            </ul>
        </div>
         <div class="_login_input_button">
                <button class="_btn _login_input_button_btn _bg" @click="join" type="button">JOIN NOW</button>

                <button class="_btn _1steps_DISCARD_btn _bg" type="button">DISCARD</button>
         </div>
    </div>    
</template>

<script>
export default {
    data(){
        return{
            formdata:{
                title:'',
                cat_id:'',
                user_id:this.authInfo,
                price:'',
                videoLink:'',
                description:'',
                openingMassage:'',
                daliveryTime:'',
                isFeatured:'',
            },
                items:[],
          itemName:'',
          itemPrice:0,
          ok:0,
          alljobs:'',
          visible: false,
          catagory:'catagory'

        }
    },
    methods:{
        join(){
            this.$store.dispatch('setTabInfo',3);
        },
       
    }

}
</script>

<style>

</style>
