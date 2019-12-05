<template>
    <div>
	 <!-- <footer id="sub_footer" class="p_top_bottom">
        <div class="container">
            <div class="subfooter_head">
                <p>Browse by city</p>
            </div>
            <ul class="subfooter_link">
                <li v-for="(loc,index) in allLocation" :key="index" class="ok"><router-link :to="`/marketplace?cat=&str=&loc=${loc.id}`">{{loc.location}}</router-link></li>
            </ul>
        </div>
    </footer> -->

	<footer id="main_footer_area" class="p_top_bottom" style="background: url(img/footer-bg.jpg) no-repeat; background-size: cover; background-attachment: fixed">
        <div class="main_footer_overlay"></div>
        <div class="container">
            <div class="row footer_border_bottom">
                <div class="col-md-3">
                    <div class="footer_contact_area footer_style">
                        <h4>Contact</h4>
                        <ul class="footer_contact_link">
                            <li><a href="#">customer help center</a></li>
                            <li><a href="#">contact us</a></li>
                            <li class="footer_social_icons_area">
                                <ul class="footer_social_icons">
                                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                    <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="footer_discover_area footer_style">
                        <h4>Discover</h4>
                        <ul class="footer_discover_link">
                            <li><a href="#">treatment guide</a></li>
                            <li><a href="#">the treatment file</a></li>
                            <li><a href="#">treatment gift card</a></li>
                            <li><a href="#">Sign up for our newslatter</a></li>
                            <li><a href="#">Recommend a salon</a></li>
                            <li><a href="#">the treatwell glossary</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="footer_partners_area footer_style">
                        <h4>Partners</h4>
                        <ul class="footer_partners_link">
                            <li><a href="#">list your business</a></li>
                            <li><a href="#">partner help center</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="footer_company_area footer_style">
                        <H4>Company</H4>
                        <ul class="footer_company_link">
							<li><router-link :to="{name:'terms'}"> Terms & Privacy</router-link></li>
							<li><router-link :to="{name:'about'}">About</router-link></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="footer_copy_write text-center">
                        <p>Micro Engine <span>&copy; 2019 MICROJOB</span></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>



    </div>


</template>

<script>
export default {
    data(){
        return{
            allLocation:[]
        }
    },
    created(){
        this.getlocations()
    },
    methods:{
        async getlocations(){
             const res = await this.callApi('get','location')
            if(res.status===200){
                this.allLocation = res.data
            }
            else{
                this.swr()
            }

         }
    }
}
</script>
<style>

</style>
