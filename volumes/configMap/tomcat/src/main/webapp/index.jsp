<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Deepak Sagar - Portfolio</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              primary: "#2563eb",
              secondary: "#64748b",
            },
            borderRadius: {
              none: "0px",
              sm: "4px",
              DEFAULT: "8px",
              md: "12px",
              lg: "16px",
              xl: "20px",
              "2xl": "24px",
              "3xl": "32px",
              full: "9999px",
              button: "8px",
            },
          },
        },
      };
    </script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
      rel="stylesheet"
    />
    <style>
      :where([class^="ri-"])::before { content: "\f3c2"; }
      .skill-progress {
      transition: width 1s ease-in-out;
      }
      .scroll-progress {
      position: fixed;
      top: 0;
      left: 0;
      width: 0%;
      height: 3px;
      background: #2563eb;
      z-index: 1000;
      transition: width 0.3s;
      }
      .custom-cursor {
      width: 20px;
      height: 20px;
      border: 2px solid #2563eb;
      border-radius: 50%;
      position: fixed;
      pointer-events: none;
      z-index: 9999;
      transition: transform 0.2s;
      }
    </style>
  </head>
  <body class="bg-white">
    <div id="scrollProgress" class="scroll-progress"></div>
    <div id="customCursor" class="custom-cursor"></div>
    <header class="fixed top-0 left-0 right-0 bg-white shadow-sm z-50">
      <nav class="container mx-auto px-6 py-4">
        <div class="flex justify-between items-center">
          <a href="#" class="text-2xl font-['Pacifico'] text-primary"
            >Deepak Sagar</a>
       <a href="hello">Go to Hello Servlet</a>
          <div class="hidden md:flex space-x-8">
            <a
              href="#home"
              class="text-gray-600 hover:text-primary transition-colors cursor-pointer"
              >Home</a
            >
            <a
              href="#about"
              class="text-gray-600 hover:text-primary transition-colors cursor-pointer"
              >About</a
            >
            <a
              href="#portfolio"
              class="text-gray-600 hover:text-primary transition-colors cursor-pointer"
              >Portfolio</a
            >
            <a
              href="#skills"
              class="text-gray-600 hover:text-primary transition-colors cursor-pointer"
              >Skills</a
            >
            <a
              href="#experience"
              class="text-gray-600 hover:text-primary transition-colors cursor-pointer"
              >Experience</a
            >
            <a
              href="#contact"
              class="text-gray-600 hover:text-primary transition-colors cursor-pointer"
              >Contact</a
            >
          </div>
          <button
            id="themeToggle"
            class="w-10 h-10 flex items-center justify-center text-gray-600 hover:text-primary transition-colors cursor-pointer"
          >
            <i class="ri-sun-line ri-xl"></i>
          </button>
        </div>
      </nav>
    </header>
    <main class="pt-20">
      <section id="home" class="min-h-screen relative overflow-hidden">
        <div
          class="absolute inset-0 bg-cover bg-center"
          style="background-image: url('https://public.readdy.ai/ai/img_res/caa5172764d1b91eb44a4ce409442d43.jpg'); opacity: 0.1;"
        ></div>
        <div class="container mx-auto px-6 py-20">
          <div class="flex flex-col md:flex-row items-center justify-between">
            <div class="md:w-1/2 space-y-8">
              <h1 class="text-5xl font-bold text-gray-900">
                Hi, I'm <span class="text-primary">Deepak Sagar</span>
                <br />
                DevOps Engineer
              </h1>
              <p class="text-xl text-gray-600">
                Automating and optimizing infrastructure with expertise in
                CI/CD, cloud technologies, and containerization. Bridging the
                gap between development and operations.
              </p>
              <div class="flex space-x-4">
                <button
                  class="bg-primary text-white px-8 py-3 !rounded-button hover:bg-blue-700 transition-colors cursor-pointer whitespace-nowrap"
                >
                  Download CV
                </button>
                <button
                  class="border-2 border-primary text-primary px-8 py-3 !rounded-button hover:bg-primary hover:text-white transition-colors cursor-pointer whitespace-nowrap"
                >
                  Contact Me
                </button>
              </div>
              <div class="flex space-x-6">
                <a
                  href="#"
                  class="w-10 h-10 flex items-center justify-center text-gray-600 hover:text-primary transition-colors cursor-pointer"
                >
                  <i class="ri-linkedin-line ri-xl"></i>
                </a>
                <a
                  href="#"
                  class="w-10 h-10 flex items-center justify-center text-gray-600 hover:text-primary transition-colors cursor-pointer"
                >
                  <i class="ri-github-line ri-xl"></i>
                </a>
                <a
                  href="#"
                  class="w-10 h-10 flex items-center justify-center text-gray-600 hover:text-primary transition-colors cursor-pointer"
                >
                  <i class="ri-twitter-line ri-xl"></i>
                </a>
              </div>
            </div>
            <div class="md:w-1/2 mt-12 md:mt-0">
            </div>
          </div>
        </div>
      </section>
      <section id="about" class="py-20 bg-gray-50">
        <div class="container mx-auto px-6">
          <h2 class="text-4xl font-bold text-center mb-16">About Me</h2>
          <div class="flex flex-col md:flex-row items-center gap-12">
            <div class="md:w-1/2">
              <div class="bg-white p-6 rounded-lg shadow-lg">
                <div class="space-y-4">
                  <div class="flex items-center justify-between">
                    <span class="text-gray-700">Skills</span>
                    <span class="text-gray-600"
                      >SQL,Linux,AWS,DevOps,Jenkins,Docker,Python,CI/Cd,Kubernetes</span
                    >
                  </div>
                  <div class="flex items-center justify-between">
                    <span class="text-gray-700">Language</span>
                    <span class="text-gray-600"
                      >English, hindi</span>
                  </div>
                  <div class="flex items-center justify-between">
                    <span class="text-gray-700">Awards & Honor</span>
                    <span class="text-gray-600"
                      >Secured top percentile in JEE Advanced</span>
                  </div>
                  <div class="flex items-center justify-between">
                    <span class="text-gray-700">Test score</span>
                    <span class="text-gray-600"
                      >JEE Advance ( 1700 ), JEE Mains ( 2700 )</span
                    >
                  </div>
                  <div class="flex items-center justify-between">
                    <span class="text-gray-700">Total Experience</span>
                    <span class="text-gray-600">1 Year</span>
                  </div>
                  <div class="flex items-center justify-between">
                    <span class="text-gray-700">Company Name</span>
                    <span class="text-gray-600">NIT Raipur</span>
                  </div>
                  <div class="flex items-center justify-between">
                    <span class="text-gray-700">Duration</span>
                    <span class="text-gray-600">June 2022 - January 2024</span>
                  </div>
                  <div class="flex items-center justify-between">
                    <span class="text-gray-700">Job Profile</span>
                    <span class="text-gray-600">Intern</span>
                  </div>
                  <div class="flex items-center justify-between">
                    <span class="text-gray-700">Annual Salary</span>
                    <span class="text-gray-600">10 Lakh(s)</span>
                  </div>
                </div>
              </div>
            </div>
            <div class="md:w-1/2 space-y-6">
              <h3 class="text-2xl font-semibold text-gray-900">
                Full Stack Developer & Cloud Engineer
              </h3>
              <p class="text-gray-600">
                With over 8 years of experience in web development, I've had the
                privilege of working with diverse teams and clients across
                various industries. My passion lies in creating intuitive,
                user-centric applications that solve real-world problems.
              </p>
              <div class="grid grid-cols-2 gap-6">
                <div>
                  <h4 class="font-semibold text-gray-900">Location</h4>
                  <p class="text-gray-600">MOradabad,UP</p>
                </div>
                <div>
                  <h4 class="font-semibold text-gray-900">Experience</h4>
                  <p class="text-gray-600">8+ Years</p>
                </div>
                <div>
                  <h4 class="font-semibold text-gray-900">Projects</h4>
                  <p class="text-gray-600">100+ Completed</p>
                </div>
                <div>
                  <h4 class="font-semibold text-gray-900">Clients</h4>
                  <p class="text-gray-600">50+ Satisfied</p>
                </div>
              </div>
              <button
                class="bg-primary text-white px-8 py-3 !rounded-button hover:bg-blue-700 transition-colors cursor-pointer whitespace-nowrap"
              >
                Download Resume
              </button>
            </div>
          </div>
        </div>
      </section>
      <section id="skills" class="py-20">
        <div class="container mx-auto px-6">
          <h2 class="text-4xl font-bold text-center mb-16">
            Skills & Expertise
          </h2>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div class="p-6 bg-white rounded-lg shadow-lg">
              <h3 class="text-xl font-semibold mb-6">Cloud & Infrastructure</h3>
              <div class="space-y-4">
                <div class="skill-item">
                  <div class="flex justify-between mb-2">
                    <span class="text-gray-700">AWS</span>
                    <span class="text-primary">95%</span>
                  </div>
                  <div class="bg-gray-200 rounded-full h-2">
                    <div
                      class="bg-primary rounded-full h-2 skill-progress"
                      style="width: 95%"
                    ></div>
                  </div>
                </div>
                <div class="skill-item">
                  <div class="flex justify-between mb-2">
                    <span class="text-gray-700">Terraform</span>
                    <span class="text-primary">90%</span>
                  </div>
                  <div class="bg-gray-200 rounded-full h-2">
                    <div
                      class="bg-primary rounded-full h-2 skill-progress"
                      style="width: 90%"
                    ></div>
                  </div>
                </div>
                <div class="skill-item">
                  <div class="flex justify-between mb-2">
                    <span class="text-gray-700">Kubernetes</span>
                    <span class="text-primary">85%</span>
                  </div>
                  <div class="bg-gray-200 rounded-full h-2">
                    <div
                      class="bg-primary rounded-full h-2 skill-progress"
                      style="width: 85%"
                    ></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="p-6 bg-white rounded-lg shadow-lg">
              <h3 class="text-xl font-semibold mb-6">CI/CD & Automation</h3>
              <div class="space-y-4">
                <div class="skill-item">
                  <div class="flex justify-between mb-2">
                    <span class="text-gray-700">Jenkins</span>
                    <span class="text-primary">90%</span>
                  </div>
                  <div class="bg-gray-200 rounded-full h-2">
                    <div
                      class="bg-primary rounded-full h-2 skill-progress"
                      style="width: 90%"
                    ></div>
                  </div>
                </div>
                <div class="skill-item">
                  <div class="flex justify-between mb-2">
                    <span class="text-gray-700">GitLab CI</span>
                    <span class="text-primary">85%</span>
                  </div>
                  <div class="bg-gray-200 rounded-full h-2">
                    <div
                      class="bg-primary rounded-full h-2 skill-progress"
                      style="width: 85%"
                    ></div>
                  </div>
                </div>
                <div class="skill-item">
                  <div class="flex justify-between mb-2">
                    <span class="text-gray-700">Ansible</span>
                    <span class="text-primary">80%</span>
                  </div>
                  <div class="bg-gray-200 rounded-full h-2">
                    <div
                      class="bg-primary rounded-full h-2 skill-progress"
                      style="width: 80%"
                    ></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="p-6 bg-white rounded-lg shadow-lg">
              <h3 class="text-xl font-semibold mb-6">Monitoring & Security</h3>
              <div class="space-y-4">
                <div class="skill-item">
                  <div class="flex justify-between mb-2">
                    <span class="text-gray-700">Prometheus</span>
                    <span class="text-primary">85%</span>
                  </div>
                  <div class="bg-gray-200 rounded-full h-2">
                    <div
                      class="bg-primary rounded-full h-2 skill-progress"
                      style="width: 85%"
                    ></div>
                  </div>
                </div>
                <div class="skill-item">
                  <div class="flex justify-between mb-2">
                    <span class="text-gray-700">ELK Stack</span>
                    <span class="text-primary">80%</span>
                  </div>
                  <div class="bg-gray-200 rounded-full h-2">
                    <div
                      class="bg-primary rounded-full h-2 skill-progress"
                      style="width: 80%"
                    ></div>
                  </div>
                </div>
                <div class="skill-item">
                  <div class="flex justify-between mb-2">
                    <span class="text-gray-700">Security Tools</span>
                    <span class="text-primary">75%</span>
                  </div>
                  <div class="bg-gray-200 rounded-full h-2">
                    <div
                      class="bg-primary rounded-full h-2 skill-progress"
                      style="width: 75%"
                    ></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section id="portfolio" class="py-20 bg-gray-50">
        <div class="container mx-auto px-6">
          <h2 class="text-4xl font-bold text-center mb-16">Portfolio</h2>
          <div class="flex justify-center mb-12">
            <div class="inline-flex bg-white rounded-full p-1 shadow-md">
              <button
                class="px-6 py-2 rounded-full text-primary bg-blue-50 cursor-pointer whitespace-nowrap"
              >
                All
              </button>
              <button
                class="px-6 py-2 rounded-full text-gray-600 hover:text-primary cursor-pointer whitespace-nowrap"
              >
                Web Apps
              </button>
              <button
                class="px-6 py-2 rounded-full text-gray-600 hover:text-primary cursor-pointer whitespace-nowrap"
              >
                Mobile Apps
              </button>
              <button
                class="px-6 py-2 rounded-full text-gray-600 hover:text-primary cursor-pointer whitespace-nowrap"
              >
                UI/UX
              </button>
            </div>
          </div>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div
              class="group relative overflow-hidden rounded-lg shadow-lg cursor-pointer"
            >
              <img
                src="https://public.readdy.ai/ai/img_res/45b2f1d4d5398a0396c3e86f279e9cd8.jpg"
                alt="Project 1"
                class="w-full h-64 object-cover transition-transform duration-300 group-hover:scale-110"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/80 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div class="absolute bottom-0 left-0 right-0 p-6">
                  <h3 class="text-xl font-semibold text-white mb-2">
                    Cloud Migration Project
                  </h3>
                  <p class="text-gray-200 mb-4">
                    Migrated legacy systems to microservices architecture on AWS
                  </p>
                  <div class="flex space-x-4">
                    <a
                      href="#"
                      class="text-white hover:text-primary transition-colors"
                    >
                      <i class="ri-github-line ri-lg"></i>
                    </a>
                    <a
                      href="#"
                      class="text-white hover:text-primary transition-colors"
                    >
                      <i class="ri-external-link-line ri-lg"></i>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div
              class="group relative overflow-hidden rounded-lg shadow-lg cursor-pointer"
            >
              <img
                src="https://public.readdy.ai/ai/img_res/9082c86a373f4d4ab4ca28dc21f5a462.jpg"
                alt="Project 2"
                class="w-full h-64 object-cover transition-transform duration-300 group-hover:scale-110"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/80 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div class="absolute bottom-0 left-0 right-0 p-6">
                  <h3 class="text-xl font-semibold text-white mb-2">
                    Social Connect
                  </h3>
                  <p class="text-gray-200 mb-4">
                    A modern social networking platform
                  </p>
                  <div class="flex space-x-4">
                    <a
                      href="#"
                      class="text-white hover:text-primary transition-colors"
                    >
                      <i class="ri-github-line ri-lg"></i>
                    </a>
                    <a
                      href="#"
                      class="text-white hover:text-primary transition-colors"
                    >
                      <i class="ri-external-link-line ri-lg"></i>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div
              class="group relative overflow-hidden rounded-lg shadow-lg cursor-pointer"
            >
              <img
                src="https://public.readdy.ai/ai/img_res/6d58c648f9c384ef9f80b78c02e800f4.jpg"
                alt="Project 3"
                class="w-full h-64 object-cover transition-transform duration-300 group-hover:scale-110"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/80 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300"
              >
                <div class="absolute bottom-0 left-0 right-0 p-6">
                  <h3 class="text-xl font-semibold text-white mb-2">
                    E-Commerce Platform
                  </h3>
                  <p class="text-gray-200 mb-4">
                    A full-featured online shopping platform
                  </p>
                  <div class="flex space-x-4">
                    <a
                      href="#"
                      class="text-white hover:text-primary transition-colors"
                    >
                      <i class="ri-github-line ri-lg"></i>
                    </a>
                    <a
                      href="#"
                      class="text-white hover:text-primary transition-colors"
                    >
                      <i class="ri-external-link-line ri-lg"></i>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section id="experience" class="py-20">
        <div class="container mx-auto px-6">
          <h2 class="text-4xl font-bold text-center mb-16">
            Professional Experience
          </h2>
          <div class="max-w-3xl mx-auto">
            <div class="relative">
              <div
                class="absolute left-1/2 transform -translate-x-1/2 h-full w-0.5 bg-gray-200"
              ></div>
              <div class="relative mb-12">
                <div class="flex items-center">
                  <div class="flex-1 text-right pr-8">
                    <h3 class="text-xl font-semibold text-gray-900">
                      Senior DevOps Engineer
                    </h3>
                    <p class="text-primary">Google Cloud</p>
                    <p class="text-gray-600">2021 - Present</p>
                  </div>
                  <div
                    class="w-8 h-8 bg-primary rounded-full flex items-center justify-center"
                  >
                    <i class="ri-briefcase-line text-white"></i>
                  </div>
                  <div class="flex-1 pl-8">
                    <p class="text-gray-600">
                      Led infrastructure automation initiatives and implemented
                      GitOps practices. Reduced deployment time by 60% and
                      achieved 99.99% uptime across production services. Managed
                      multi-cloud Kubernetes clusters serving millions of users.
                    </p>
                  </div>
                </div>
              </div>
              <div class="relative mb-12">
                <div class="flex items-center">
                  <div class="flex-1 text-right pr-8">
                    <h3 class="text-xl font-semibold text-gray-900">
                      DevOps Engineer
                    </h3>
                    <p class="text-primary">AWS</p>
                    <p class="text-gray-600">2018 - 2021</p>
                  </div>
                  <div
                    class="w-8 h-8 bg-primary rounded-full flex items-center justify-center"
                  >
                    <i class="ri-briefcase-line text-white"></i>
                  </div>
                  <div class="flex-1 pl-8">
                    <p class="text-gray-600">
                      Designed and implemented CI/CD pipelines using AWS
                      services. Automated infrastructure deployment with
                      Terraform and CloudFormation. Reduced infrastructure costs
                      by 35% through optimization.
                    </p>
                  </div>
                </div>
              </div>
              <div class="relative">
                <div class="flex items-center">
                  <div class="flex-1 text-right pr-8">
                    <h3 class="text-xl font-semibold text-gray-900">
                      Systems Engineer
                    </h3>
                    <p class="text-primary">Microsoft Azure</p>
                    <p class="text-gray-600">2016 - 2018</p>
                  </div>
                  <div
                    class="w-8 h-8 bg-primary rounded-full flex items-center justify-center"
                  >
                    <i class="ri-briefcase-line text-white"></i>
                  </div>
                  <div class="flex-1 pl-8">
                    <p class="text-gray-600">
                      Managed large-scale cloud infrastructure and implemented
                      monitoring solutions. Set up automated disaster recovery
                      procedures and reduced system downtime by 75%.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section id="testimonials" class="py-20 bg-gray-50">
        <div class="container mx-auto px-6">
          <h2 class="text-4xl font-bold text-center mb-16">
            Client Testimonials
          </h2>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div class="bg-white p-6 rounded-lg shadow-lg">
              <div class="flex items-center mb-4">
                <img
                  src="https://public.readdy.ai/ai/img_res/61751a0c4e2ceece9468a6c98b6bb867.jpg"
                  alt="Sarah Johnson"
                  class="w-12 h-12 rounded-full object-cover"
                />
                <div class="ml-4">
                  <h4 class="font-semibold text-gray-900">Sarah Johnson</h4>
                  <p class="text-gray-600">CEO at TechCorp</p>
                </div>
              </div>
              <p class="text-gray-600">
                "James delivered exceptional results for our project. His
                technical expertise and attention to detail made him a valuable
                asset to our team."
              </p>
              <div class="flex mt-4">
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-fill text-yellow-400"></i>
              </div>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg">
              <div class="flex items-center mb-4">
                <img
                  src="https://public.readdy.ai/ai/img_res/7ce5aa4188e58a68801a92aa28fe4fd3.jpg"
                  alt="Michael Chen"
                  class="w-12 h-12 rounded-full object-cover"
                />
                <div class="ml-4">
                  <h4 class="font-semibold text-gray-900">Michael Chen</h4>
                  <p class="text-gray-600">CTO at StartupX</p>
                </div>
              </div>
              <p class="text-gray-600">
                "Working with Deepak was a pleasure. He brought innovative
                solutions to our challenges and consistently delivered
                high-quality work."
              </p>
              <div class="flex mt-4">
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-fill text-yellow-400"></i>
              </div>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg">
              <div class="flex items-center mb-4">
                <img
                  src="https://public.readdy.ai/ai/img_res/6598dc7f1322d9e41d4713d1496bd6e1.jpg"
                  alt="David Smith"
                  class="w-12 h-12 rounded-full object-cover"
                />
                <div class="ml-4">
                  <h4 class="font-semibold text-gray-900">David Smith</h4>
                  <p class="text-gray-600">Product Manager at InnovateCo</p>
                </div>
              </div>
              <p class="text-gray-600">
                "Deepak's technical skills and problem-solving abilities are
                outstanding. He's a great communicator and team player."
              </p>
              <div class="flex mt-4">
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-fill text-yellow-400"></i>
                <i class="ri-star-half-fill text-yellow-400"></i>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section id="contact" class="py-20">
        <div class="container mx-auto px-6">
          <h2 class="text-4xl font-bold text-center mb-16">Get In Touch</h2>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-12">
            <div>
              <h3 class="text-2xl font-semibold mb-6">Contact Information</h3>
              <div class="space-y-4">
                <div class="flex items-center">
                  <div
                    class="w-10 h-10 flex items-center justify-center text-primary"
                  >
                    <i class="ri-map-pin-line ri-lg"></i>
                  </div>
                  <p class="ml-4 text-gray-600">
                   moradabad,up
                  </p>
                </div>
                <div class="flex items-center">
                  <div
                    class="w-10 h-10 flex items-center justify-center text-primary"
                  >
                    <i class="ri-mail-line ri-lg"></i>
                  </div>
                  <p class="ml-4 text-gray-600">Sagardeepak2002@gmail.com</p>
                </div>
                <div class="flex items-center">
                  <div
                    class="w-10 h-10 flex items-center justify-center text-primary"
                  >
                    <i class="ri-phone-line ri-lg"></i>
                  </div>
                  <p class="ml-4 text-gray-600">1234567890</p>
                </div>
              </div>
              <div class="mt-8">
                <div
                  id="map"
                  class="w-full h-64 rounded-lg overflow-hidden bg-cover bg-center"
                  style="background-image: url('https://public.readdy.ai/gen_page/map_placeholder_1280x720.png')"
                ></div>
              </div>
            </div>
            <div>
              <form id="contactForm" class="space-y-6">
                <div>
                  <label for="name" class="block text-gray-700 mb-2"
                    >Name</label
                  >
                  <input
                    type="text"
                    id="name"
                    name="name"
                    class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:border-primary"
                    required
                  />
                </div>
                <div>
                  <label for="email" class="block text-gray-700 mb-2"
                    >Email</label
                  >
                  <input
                    type="email"
                    id="email"
                    name="email"
                    class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:border-primary"
                    required
                  />
                </div>
                <div>
                  <label for="subject" class="block text-gray-700 mb-2"
                    >Subject</label
                  >
                  <input
                    type="text"
                    id="subject"
                    name="subject"
                    class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:border-primary"
                    required
                  />
                </div>
                <div>
                  <label for="message" class="block text-gray-700 mb-2"
                    >Message</label
                  >
                  <textarea
                    id="message"
                    name="message"
                    rows="6"
                    class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:border-primary"
                    required
                  ></textarea>
                </div>
                <button
                  type="submit"
                  class="w-full bg-primary text-white px-8 py-3 rounded hover:bg-blue-700 transition-colors"
                >
                  Send Message
                </button>
              </form>
            </div>
          </div>
        </div>
      </section>
    </main>
    <footer class="bg-gray-900 text-white py-12">
      <div class="container mx-auto px-6">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-12">
          <div>
            <h3 class="text-2xl font-['Pacifico'] mb-4">James Wilson</h3>
            <p class="text-gray-400">
              Crafting digital experiences with passion and precision.
            </p>
          </div>
          <div>
            <h4 class="text-lg font-semibold mb-4">Quick Links</h4>
            <ul class="space-y-2">
              <li>
                <a
                  href="#home"
                  class="text-gray-400 hover:text-white transition-colors"
                  >Home</a
                >
              </li>
              <li>
                <a
                  href="#about"
                  class="text-gray-400 hover:text-white transition-colors"
                  >About</a
                >
              </li>
              <li>
                <a
                  href="#portfolio"
                  class="text-gray-400 hover:text-white transition-colors"
                  >Portfolio</a
                >
              </li>
              <li>
                <a
                  href="#contact"
                  class="text-gray-400 hover:text-white transition-colors"
                  >Contact</a
                >
              </li>
            </ul>
          </div>
          <div>
            <h4 class="text-lg font-semibold mb-4">Connect</h4>
            <div class="flex space-x-4">
              <a
                href="#"
                class="text-gray-400 hover:text-white transition-colors"
              >
                <i class="ri-linkedin-line ri-lg"></i>
              </a>
              <a
                href="#"
                class="text-gray-400 hover:text-white transition-colors"
              >
                <i class="ri-github-line ri-lg"></i>
              </a>
              <a
                href="#"
                class="text-gray-400 hover:text-white transition-colors"
              >
                <i class="ri-twitter-line ri-lg"></i>
              </a>
            </div>
          </div>
          <div>
            <h4 class="text-lg font-semibold mb-4">Newsletter</h4>
            <form class="flex">
              <input
                type="email"
                placeholder="Enter your email"
                class="flex-1 px-4 py-2 rounded-l bg-gray-800 border-gray-700 focus:outline-none"
              />
              <button
                type="submit"
                class="px-4 py-2 bg-primary text-white rounded-r hover:bg-blue-700 transition-colors"
              >
                Subscribe
              </button>
            </form>
          </div>
        </div>
        <div class="border-t border-gray-800 mt-12 pt-8 text-center">
          <p class="text-gray-400">
            &copy; 2024 James Wilson. All rights reserved.
          </p>
        </div>
      </div>
    </footer>
    <script>
      // Scroll Progress
      window.addEventListener("scroll", () => {
        const scrollProgress = document.getElementById("scrollProgress");
        const scrolled =
          (window.scrollY /
            (document.documentElement.scrollHeight - window.innerHeight)) *
          100;
        scrollProgress.style.width = scrolled + "%";
      });
      // Custom Cursor
      document.addEventListener("mousemove", (e) => {
        const cursor = document.getElementById("customCursor");
        cursor.style.left = e.clientX + "px";
        cursor.style.top = e.clientY + "px";
      });
      // Theme Toggle
      const themeToggle = document.getElementById("themeToggle");
      themeToggle.addEventListener("click", () => {
        document.body.classList.toggle("dark");
        const icon = themeToggle.querySelector("i");
        icon.classList.toggle("ri-sun-line");
        icon.classList.toggle("ri-moon-line");
      });
      // Smooth Scroll
      document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
        anchor.addEventListener("click", function (e) {
          e.preventDefault();
          document.querySelector(this.getAttribute("href")).scrollIntoView({
            behavior: "smooth",
          });
        });
      });
      // Skill Progress Animation
      const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.style.width = entry.target.getAttribute("data-width");
          }
        });
      });
      document.querySelectorAll(".skill-progress").forEach((progress) => {
        observer.observe(progress);
      });
    </script>
  </body>
</html>


