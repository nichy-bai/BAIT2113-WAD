<%@ Page Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="slideshow">
        <div class="slideshow__3"></div>
        <div class="slideshow__2"></div>
        <div class="slideshow__1"></div>
        <div class="slideshow__title">Gallerion</div>
        <div class="slideshow__subtitle">Creativity takes courage</div>
        <section class="demo"></section>
    </div>

    <section id="section10" class="demo">
        <a href="#scroll-down" title="Scroll Down"><span></span></a>
    </section>

    <div class="homepage__bodyrow">
        <div class="homepage__text">
            <div class="homepage__textrow">
                <div>
                    <a class="anchor" id="scroll-down"></a>

                    <div class="homepage__title">
                        About Gallerion
                        <a class="anchor" id="about_us"></a>
                    </div>
                    <div class="homepage__subtitle">
                        Gallerion is the world’s fastest growing online art gallery, connecting people with art and artists they love.
                        Gallerion offers a beautiful selection of paintings, drawings, sculpture, design, jewellery and photography in
                        various price ranges. It provides artists from around the world with an expertly curated environment in which to
                        exhibit and sell their work.
                    </div>
                </div>
                <div>
                    <div class="homepage__title">
                        Organization
                        <a class="anchor" id="organization"></a>
                    </div>
                    <div class="homepage__subtitle">
                        Every artist, photographer, designer or jewellery maker can create his/her own artist page on Gallerion.
                        Publication on our website is on condition the page meets our requirements and must have been approved by
                        Gallerion. A page not meeting our criteria will not be included in the overview.
                    </div>
                </div>
            </div>
        </div>
        <div class="fadein">
            <img src="https://picsum.photos/id/939/600/500">
            <img src="https://picsum.photos/id/942/600/500">
            <img src="https://picsum.photos/id/91/600/500">
        </div>
    </div>

    <div class="homepage__bodycol">
        <div class="homepage__title">
            How does it work?
        </div>
        <div class="homepage__colcontent">
            <div class="homepage__coltext">
                <svg width="4rem" height="4rem" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                <div>Selection</div>
                <br />
                <div>
                    Our experts select the best art galleries around the world.
                </div>
            </div>
            <div class="homepage__coltext">
                <svg width="4rem" height="4rem" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg>
                <div>Browse</div>
                <br />
                <div>
                    Our galleries put their best artworks online with Artsper.
                </div>
            </div>
            <div class="homepage__coltext">
                <svg width="4rem" height="4rem" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122"></path></svg>
                <div>Order</div>
                <br />
                <div>
                    Order a work online and have it delivered to you thanks to a trustworthy and secure service.
                </div>
            </div>
        </div>
        <a href="/Help.aspx" class="homepage__colfooter">
            Find out more
        </a>
    </div>

    <div class="homepage__bodyrow">
        <div class="homepage__typing">
            <div class="rw-wrapper">
                <div class="rw-sentence">
                    <span><span class="rw-title">gallerion</span>allows</span>
                    <br>
                     <div class="rw-words">
                        <div class="animation">
                            <span class="type">collectors acquiring the artworks<span class="text-cursor">|</span></span>
                            <span class="type">artists selling their artworks<span class="text-cursor">|</span></span>
                            <span class="type">curators promoting their artists<span class="text-cursor">|</span></span>
                            <span class="type">art galleries developing their business<span class="text-cursor">|</span></span>
                            <span class="type">art connoisseurs buying the best artworks<span class="text-cursor">|</span></span>
                            <span class="type">design bureaus forming the best collections<span class="text-cursor">|</span></span>
                        </div>
                    </div>
                </div>
          </div>
        </div>
        <div class="homepage__login">
            <div class="homepage__title">
                Join Us Now!
            </div>
            <a href="Login.aspx" class="homepage__loginbtn">Login</a>
            <a href="Register.aspx" class="homepage__signbtn">Sign Up</a>
        </div>
    </div>

</asp:Content>