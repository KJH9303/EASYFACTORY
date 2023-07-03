<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Dashboard</title>
  <link rel="stylesheet" href="css/feb.css" />
  <script src="https://cdn.jsdelivr.net/gh/alpine-collective/alpine-magic-helpers@0.5.x/dist/component.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.7.3/dist/alpine.min.js" defer></script>
</head>
<body>
<div id="headerContainer"></div>
<div x-data="setup()" x-init="$refs.loading.classList.add('hidden'); setColors(color);" :class="{ 'dark': isDark}">
    <!-- Loading screen -->
    <div
      x-ref="loading"
      class="fixed inset-0 z-50 flex items-center justify-center text-2xl font-semibold text-white bg-primary-darker"
    >
      <!-- Loading..... --> 
    </div> 
    <div class="flex-1 h-full overflow-x-hidden overflow-y-auto">

      <!-- Main content -->
      <main>
        <!-- Content header -->
        <div class="flex items-center justify-between px-4 py-4 border-b lg:py-6 dark:border-primary-darker">
          <!-- <div id="headerContainer"></div> -->
        </div>

        <!-- Content -->
        <div class="mt-2">
          <!-- State cards -->
          <div class="grid grid-cols-1 gap-8 p-4 lg:grid-cols-2 xl:grid-cols-4">
            <!-- Value card -->
            <div class="flex items-center justify-between p-4 bg-white rounded-md dark:bg-darker">
              <div>
                <h6
                  class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase dark:text-primary-light"
                >
                  Value
                </h6>
                <span class="text-xl font-semibold">$30,000</span>
                <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                  +4.4%
                </span>
              </div>
            </div>

            <!-- Users card -->
            <div class="flex items-center justify-between p-4 bg-white rounded-md dark:bg-darker">
              <div>
                <h6
                  class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase dark:text-primary-light"
                >
                  Users
                </h6>
                <span class="text-xl font-semibold">50,021</span>
                <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                  +2.6%
                </span>
              </div>
            </div>

            <!-- Orders card -->
            <div class="flex items-center justify-between p-4 bg-white rounded-md dark:bg-darker">
              <div>
                <h6
                  class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase dark:text-primary-light"
                >
                  Orders
                </h6>
                <span class="text-xl font-semibold">45,021</span>
                <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                  +3.1%
                </span>
              </div>
            </div>

            <!-- Tickets card -->
            <div class="flex items-center justify-between p-4 bg-white rounded-md dark:bg-darker">
              <div>
                <h6
                  class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase dark:text-primary-light"
                >
                  Tickets
                </h6>
                <span class="text-xl font-semibold">20,516</span>
                <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
                  +3.1%
                </span>
              </div>
            </div>
          </div>

          <!-- Charts -->
          <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
            <!-- Bar chart card -->
            <div class="col-span-2 bg-white rounded-md dark:bg-darker" x-data="{ isOn: false }">
              <!-- Card header -->
              <div class="flex items-center justify-between p-4 border-b dark:border-primary">
                <h4 class="text-lg font-semibold text-gray-500 dark:text-light">Bar Chart</h4>
                <div class="flex items-center space-x-2">
                  <span class="text-sm text-gray-500 dark:text-light">Last year</span>
                  <button
                    class="relative focus:outline-none"
                    x-cloak
                    @click="isOn = !isOn; $parent.updateBarChart(isOn)"
                  >
                    <div
                      class="w-12 h-6 transition rounded-full outline-none bg-primary-100 dark:bg-primary-darker"
                    ></div>
                    <div
                      class="absolute top-0 left-0 inline-flex items-center justify-center w-6 h-6 transition-all duration-200 ease-in-out transform scale-110 rounded-full shadow-sm"
                      :class="{ 'translate-x-0  bg-white dark:bg-primary-100': !isOn, 'translate-x-6 bg-primary-light dark:bg-primary': isOn }"
                    ></div>
                  </button>
                </div>
              </div>
              <!-- Chart -->
              <div class="relative p-4 h-72">
                <canvas id="barChart"></canvas>
              </div>
            </div>

            <!-- Doughnut chart card -->
            <div class="bg-white rounded-md dark:bg-darker" x-data="{ isOn: false }">
              <!-- Card header -->
              <div class="flex items-center justify-between p-4 border-b dark:border-primary">
                <h4 class="text-lg font-semibold text-gray-500 dark:text-light">Doughnut Chart</h4>
                <div class="flex items-center">
                  <button
                    class="relative focus:outline-none"
                    x-cloak
                    @click="isOn = !isOn; $parent.updateDoughnutChart(isOn)"
                  >
                    <div
                      class="w-12 h-6 transition rounded-full outline-none bg-primary-100 dark:bg-primary-darker"
                    ></div>
                    <div
                      class="absolute top-0 left-0 inline-flex items-center justify-center w-6 h-6 transition-all duration-200 ease-in-out transform scale-110 rounded-full shadow-sm"
                      :class="{ 'translate-x-0  bg-white dark:bg-primary-100': !isOn, 'translate-x-6 bg-primary-light dark:bg-primary': isOn }"
                    ></div>
                  </button>
                </div>
              </div>
              <!-- Chart -->
              <div class="relative p-4 h-72">
                <canvas id="doughnutChart"></canvas>
              </div>
            </div>
          </div>

          <!-- Two grid columns -->
          <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
            <!-- Active users chart -->
            <div class="col-span-1 bg-white rounded-md dark:bg-darker">
              <!-- Card header -->
              <div class="p-4 border-b dark:border-primary">
                <h4 class="text-lg font-semibold text-gray-500 dark:text-light">Active users right now</h4>
              </div>
              <p class="p-4">
                <span class="text-2xl font-medium text-gray-500 dark:text-light" id="usersCount">0</span>
                <span class="text-sm font-medium text-gray-500 dark:text-primary">Users</span>
              </p>
              <!-- Chart -->
              <div class="relative p-4">
                <canvas id="activeUsersChart"></canvas>
              </div>
            </div>

            <!-- Line chart card -->
            <div class="col-span-2 bg-white rounded-md dark:bg-darker" x-data="{ isOn: false }">
              <!-- Card header -->
              <div class="flex items-center justify-between p-4 border-b dark:border-primary">
                <h4 class="text-lg font-semibold text-gray-500 dark:text-light">Line Chart</h4>
                <div class="flex items-center">
                  <button
                    class="relative focus:outline-none"
                    x-cloak
                    @click="isOn = !isOn; $parent.updateLineChart()"
                  >
                    <div
                      class="w-12 h-6 transition rounded-full outline-none bg-primary-100 dark:bg-primary-darker"
                    ></div>
                    <div
                      class="absolute top-0 left-0 inline-flex items-center justify-center w-6 h-6 transition-all duration-200 ease-in-out transform scale-110 rounded-full shadow-sm"
                      :class="{ 'translate-x-0  bg-white dark:bg-primary-100': !isOn, 'translate-x-6 bg-primary-light dark:bg-primary': isOn }"
                    ></div>
                  </button>
                </div>
              </div>
              <!-- Chart -->
              <div class="relative p-4 h-72">
                <canvas id="lineChart"></canvas>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>

  <!-- All javascript code in this project for now is just for demo DON'T RELY ON IT  -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.bundle.min.js"></script>
  <script src="test.js"></script>
  <script>
    const setup = () => {
      const getTheme = () => {
        if (window.localStorage.getItem('dark')) {
          return JSON.parse(window.localStorage.getItem('dark'))
        }

        return !!window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches
      }

      const setTheme = (value) => {
        window.localStorage.setItem('dark', value)
      }

      const getColor = () => {
        if (window.localStorage.getItem('color')) {
          return window.localStorage.getItem('color')
        }
        return 'cyan'
      }

      const setColors = (color) => {
        const root = document.documentElement
        root.style.setProperty('--color-primary', `var(--color-${color})`)
        root.style.setProperty('--color-primary-50', `var(--color-${color}-50)`)
        root.style.setProperty('--color-primary-100', `var(--color-${color}-100)`)
        root.style.setProperty('--color-primary-light', `var(--color-${color}-light)`)
        root.style.setProperty('--color-primary-lighter', `var(--color-${color}-lighter)`)
        root.style.setProperty('--color-primary-dark', `var(--color-${color}-dark)`)
        root.style.setProperty('--color-primary-darker', `var(--color-${color}-darker)`)
        this.selectedColor = color
        window.localStorage.setItem('color', color)
        //
      }

      const updateBarChart = (on) => {
        const data = {
          data: randomData(),
          backgroundColor: 'rgb(207, 250, 254)',
        }
        if (on) {
          barChart.data.datasets.push(data)
          barChart.update()
        } else {
          barChart.data.datasets.splice(1)
          barChart.update()
        }
      }

      const updateDoughnutChart = (on) => {
        const data = random()
        const color = 'rgb(207, 250, 254)'
        if (on) {
          doughnutChart.data.labels.unshift('Seb')
          doughnutChart.data.datasets[0].data.unshift(data)
          doughnutChart.data.datasets[0].backgroundColor.unshift(color)
          doughnutChart.update()
        } else {
          doughnutChart.data.labels.splice(0, 1)
          doughnutChart.data.datasets[0].data.splice(0, 1)
          doughnutChart.data.datasets[0].backgroundColor.splice(0, 1)
          doughnutChart.update()
        }
      }

      const updateLineChart = () => {
        lineChart.data.datasets[0].data.reverse()
        lineChart.update()
      }

      return {
        loading: true,
        isDark: getTheme(),
        toggleTheme() {
          this.isDark = !this.isDark
          setTheme(this.isDark)
        },
        setLightTheme() {
          this.isDark = false
          setTheme(this.isDark)
        },
        setDarkTheme() {
          this.isDark = true
          setTheme(this.isDark)
        },
        color: getColor(),
        selectedColor: 'cyan',
        setColors,
        toggleSidbarMenu() {
          this.isSidebarOpen = !this.isSidebarOpen
        },
        isSettingsPanelOpen: false,
        openSettingsPanel() {
          this.isSettingsPanelOpen = true
          this.$nextTick(() => {
            this.$refs.settingsPanel.focus()
          })
        },
        isNotificationsPanelOpen: false,
        openNotificationsPanel() {
          this.isNotificationsPanelOpen = true
          this.$nextTick(() => {
            this.$refs.notificationsPanel.focus()
          })
        },
        isSearchPanelOpen: false,
        openSearchPanel() {
          this.isSearchPanelOpen = true
          this.$nextTick(() => {
            this.$refs.searchInput.focus()
          })
        },
        isMobileSubMenuOpen: false,
        openMobileSubMenu() {
          this.isMobileSubMenuOpen = true
          this.$nextTick(() => {
            this.$refs.mobileSubMenu.focus()
          })
        },
        isMobileMainMenuOpen: false,
        openMobileMainMenu() {
          this.isMobileMainMenuOpen = true
          this.$nextTick(() => {
            this.$refs.mobileMainMenu.focus()
          })
        },
        updateBarChart,
        updateDoughnutChart,
        updateLineChart,
      }
    }

    // 현재 날짜, 현재 시간 
    // yyyy/mm/dd 
    // hh/mm/ss
    function updateTime() {
      var currentTime = new Date();
      var hours = currentTime.getHours();
      var minutes = currentTime.getMinutes();
      var seconds = currentTime.getSeconds();
      var year = currentTime.getFullYear();
      var month = ("0" + (currentTime.getMonth() + 1)).slice(-2);
      var day = ("0" + currentTime.getDate()).slice(-2);

      hours = ("0" + hours).slice(-2);
      minutes = ("0" + minutes).slice(-2);
      seconds = ("0" + seconds).slice(-2);

      var timeString = hours + ":" + minutes + ":" + seconds;
      var dateString = year + "/" + month + "/" + day;

      document.getElementById("time").innerHTML = timeString;
      document.getElementById("date").innerHTML = dateString;
  }

  setInterval(updateTime, 1000)

function loadHTMLFile(targetSelector, url, callback) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          document.querySelector(targetSelector).innerHTML = this.responseText;
          if (typeof callback === 'function') {
              callback();
          }
      }
  };
  xhttp.open("GET", url, true);
  xhttp.send();
}

function loadHeaderAndSidebar() {
  loadHTMLFile("#headerContainer", "/resources/html/main/header.html", updateTime);
}


// 페이지가 로드될 때 헤더와 사이드바 파일을 불러와 삽입
window.addEventListener('load', loadHeaderAndSidebar);
  </script>
</body>
</html>
