document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('downloadBtnFeb1').addEventListener('click', () => {
        fetch('/feb/download-data-feb1')
          .then((response) => {
            if (!response.ok) {
              throw new Error('데이터를 가져오는 데 실패했습니다.');
            }
            return response.json();
          })
          .then((dataList) => {
            // 데이터 리스트가 비어있으면 다운로드하지 않고 알림을 표시
            if (!dataList || dataList.length === 0) {
              console.error('데이터 리스트가 없습니다.');
              alert('데이터를 찾을 수 없습니다.');
              return;
            }

            // 데이터를 가져온 후 바로 다운로드 함수 호출
            showConfirmationAndDownload(dataList);
          })
          .catch((error) => {
            console.error('데이터 가져오기 실패:', error);
            alert('데이터를 가져오는 데 실패했습니다.');
          });
    });

    function showConfirmationAndDownload(dataList) {
        var result = confirm("1공정의 모든 데이터를 다운로드 하시겠습니까?");

        if (result) {
            downloadExcelData(dataList);
        }
    }

    function downloadExcelData(dataList) {
        const filename = 'Wafer_Fabrication.xlsx';
        const sheet = XLSX.utils.json_to_sheet(dataList);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, sheet, 'Wafer_Fabrication');

        // 엑셀 파일 생성
        const excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });

        // Blob 형태로 변환하여 다운로드
        const blob = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
        const url = window.URL.createObjectURL(blob);

        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        a.click();
    }
});

document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('downloadBtnFeb2').addEventListener('click', () => {
        fetch('/feb/download-data-feb2')
          .then((response) => {
            if (!response.ok) {
              throw new Error('데이터를 가져오는 데 실패했습니다.');
            }
            return response.json();
          })
          .then((dataList) => {
            // 데이터 리스트가 비어있으면 다운로드하지 않고 알림을 표시
            if (!dataList || dataList.length === 0) {
              console.error('데이터 리스트가 없습니다.');
              alert('데이터를 찾을 수 없습니다.');
              return;
            }

            // 데이터를 가져온 후 바로 다운로드 함수 호출
            showConfirmationAndDownload(dataList);
          })
          .catch((error) => {
            console.error('데이터 가져오기 실패:', error);
            alert('데이터를 가져오는 데 실패했습니다.');
          });
    });

    function showConfirmationAndDownload(dataList) {
        var result = confirm("2공정의 모든 데이터를 다운로드 하시겠습니까?");

        if (result) {
            downloadExcelData(dataList);
        }
    }

    function downloadExcelData(dataList) {
        const filename = 'Oxidation.xlsx';
        const sheet = XLSX.utils.json_to_sheet(dataList);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, sheet, 'Oxidation');

        // 엑셀 파일 생성
        const excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });

        // Blob 형태로 변환하여 다운로드
        const blob = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
        const url = window.URL.createObjectURL(blob);

        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        a.click();
    }
});

document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('downloadBtnFeb3').addEventListener('click', () => {
        fetch('/feb/download-data-feb3')
          .then((response) => {
            if (!response.ok) {
              throw new Error('데이터를 가져오는 데 실패했습니다.');
            }
            return response.json();
          })
          .then((dataList) => {
            // 데이터 리스트가 비어있으면 다운로드하지 않고 알림을 표시
            if (!dataList || dataList.length === 0) {
              console.error('데이터 리스트가 없습니다.');
              alert('데이터를 찾을 수 없습니다.');
              return;
            }

            // 데이터를 가져온 후 바로 다운로드 함수 호출
            showConfirmationAndDownload(dataList);
          })
          .catch((error) => {
            console.error('데이터 가져오기 실패:', error);
            alert('데이터를 가져오는 데 실패했습니다.');
          });
    });

    function showConfirmationAndDownload(dataList) {
        var result = confirm("3공정의 모든 데이터를 다운로드 하시겠습니까?");

        if (result) {
            downloadExcelData(dataList);
        }
    }

    function downloadExcelData(dataList) {
        const filename = 'Photo_Lithography.xlsx';
        const sheet = XLSX.utils.json_to_sheet(dataList);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, sheet, 'Photo_Lithography');

        // 엑셀 파일 생성
        const excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });

        // Blob 형태로 변환하여 다운로드
        const blob = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
        const url = window.URL.createObjectURL(blob);

        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        a.click();
    }
});

document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('downloadBtnFeb4').addEventListener('click', () => {
        fetch('/feb/download-data-feb4')
          .then((response) => {
            if (!response.ok) {
              throw new Error('데이터를 가져오는 데 실패했습니다.');
            }
            return response.json();
          })
          .then((dataList) => {
            // 데이터 리스트가 비어있으면 다운로드하지 않고 알림을 표시
            if (!dataList || dataList.length === 0) {
              console.error('데이터 리스트가 없습니다.');
              alert('데이터를 찾을 수 없습니다.');
              return;
            }

            // 데이터를 가져온 후 바로 다운로드 함수 호출
            showConfirmationAndDownload(dataList);
          })
          .catch((error) => {
            console.error('데이터 가져오기 실패:', error);
            alert('데이터를 가져오는 데 실패했습니다.');
          });
    });

    function showConfirmationAndDownload(dataList) {
        var result = confirm("4공정의 모든 데이터를 다운로드 하시겠습니까?");

        if (result) {
            downloadExcelData(dataList);
        }
    }

    function downloadExcelData(dataList) {
        const filename = 'Etching.xlsx';
        const sheet = XLSX.utils.json_to_sheet(dataList);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, sheet, 'Etching');

        // 엑셀 파일 생성
        const excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });

        // Blob 형태로 변환하여 다운로드
        const blob = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
        const url = window.URL.createObjectURL(blob);

        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        a.click();
    }
});

document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('downloadBtnFeb5').addEventListener('click', () => {
        fetch('/feb/download-data-feb5')
          .then((response) => {
            if (!response.ok) {
              throw new Error('데이터를 가져오는 데 실패했습니다.');
            }
            return response.json();
          })
          .then((dataList) => {
            // 데이터 리스트가 비어있으면 다운로드하지 않고 알림을 표시
            if (!dataList || dataList.length === 0) {
              console.error('데이터 리스트가 없습니다.');
              alert('데이터를 찾을 수 없습니다.');
              return;
            }

            // 데이터를 가져온 후 바로 다운로드 함수 호출
            showConfirmationAndDownload(dataList);
          })
          .catch((error) => {
            console.error('데이터 가져오기 실패:', error);
            alert('데이터를 가져오는 데 실패했습니다.');
          });
    });

    function showConfirmationAndDownload(dataList) {
        var result = confirm("5공정의 모든 데이터를 다운로드 하시겠습니까?");

        if (result) {
            downloadExcelData(dataList);
        }
    }

    function downloadExcelData(dataList) {
        const filename = 'Implant.xlsx';
        const sheet = XLSX.utils.json_to_sheet(dataList);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, sheet, 'Implant');

        // 엑셀 파일 생성
        const excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });

        // Blob 형태로 변환하여 다운로드
        const blob = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
        const url = window.URL.createObjectURL(blob);

        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        a.click();
    }
});

document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('downloadBtnFeb6').addEventListener('click', () => {
        fetch('/feb/download-data-feb6')
          .then((response) => {
            if (!response.ok) {
              throw new Error('데이터를 가져오는 데 실패했습니다.');
            }
            return response.json();
          })
          .then((dataList) => {
            // 데이터 리스트가 비어있으면 다운로드하지 않고 알림을 표시
            if (!dataList || dataList.length === 0) {
              console.error('데이터 리스트가 없습니다.');
              alert('데이터를 찾을 수 없습니다.');
              return;
            }

            // 데이터를 가져온 후 바로 다운로드 함수 호출
            showConfirmationAndDownload(dataList);
          })
          .catch((error) => {
            console.error('데이터 가져오기 실패:', error);
            alert('데이터를 가져오는 데 실패했습니다.');
          });
    });

    function showConfirmationAndDownload(dataList) {
        var result = confirm("6공정의 모든 데이터를 다운로드 하시겠습니까?");

        if (result) {
            downloadExcelData(dataList);
        }
    }

    function downloadExcelData(dataList) {
        const filename = 'Metallizaion.xlsx';
        const sheet = XLSX.utils.json_to_sheet(dataList);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, sheet, 'Metallizaion');

        // 엑셀 파일 생성
        const excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });

        // Blob 형태로 변환하여 다운로드
        const blob = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
        const url = window.URL.createObjectURL(blob);

        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        a.click();
    }
});

document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('downloadBtnFeb7').addEventListener('click', () => {
        fetch('/feb/download-data-feb7')
          .then((response) => {
            if (!response.ok) {
              throw new Error('데이터를 가져오는 데 실패했습니다.');
            }
            return response.json();
          })
          .then((dataList) => {
            // 데이터 리스트가 비어있으면 다운로드하지 않고 알림을 표시
            if (!dataList || dataList.length === 0) {
              console.error('데이터 리스트가 없습니다.');
              alert('데이터를 찾을 수 없습니다.');
              return;
            }

            // 데이터를 가져온 후 바로 다운로드 함수 호출
            showConfirmationAndDownload(dataList);
          })
          .catch((error) => {
            console.error('데이터 가져오기 실패:', error);
            alert('데이터를 가져오는 데 실패했습니다.');
          });
    });

    function showConfirmationAndDownload(dataList) {
        var result = confirm("7공정의 모든 데이터를 다운로드 하시겠습니까?");

        if (result) {
            downloadExcelData(dataList);
        }
    }

    function downloadExcelData(dataList) {
        const filename = 'EDS.xlsx';
        const sheet = XLSX.utils.json_to_sheet(dataList);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, sheet, 'EDS');

        // 엑셀 파일 생성
        const excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });

        // Blob 형태로 변환하여 다운로드
        const blob = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
        const url = window.URL.createObjectURL(blob);

        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        a.click();
    }
});

document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('downloadBtnFeb8').addEventListener('click', () => {
        fetch('/feb/download-data-feb8')
          .then((response) => {
            if (!response.ok) {
              throw new Error('데이터를 가져오는 데 실패했습니다.');
            }
            return response.json();
          })
          .then((dataList) => {
            // 데이터 리스트가 비어있으면 다운로드하지 않고 알림을 표시
            if (!dataList || dataList.length === 0) {
              console.error('데이터 리스트가 없습니다.');
              alert('데이터를 찾을 수 없습니다.');
              return;
            }

            // 데이터를 가져온 후 바로 다운로드 함수 호출
            showConfirmationAndDownload(dataList);
          })
          .catch((error) => {
            console.error('데이터 가져오기 실패:', error);
            alert('데이터를 가져오는 데 실패했습니다.');
          });
    });

    function showConfirmationAndDownload(dataList) {
        var result = confirm("8공정의 모든 데이터를 다운로드 하시겠습니까?");

        if (result) {
            downloadExcelData(dataList);
        }
    }

    function downloadExcelData(dataList) {
        const filename = 'Packaging.xlsx';
        const sheet = XLSX.utils.json_to_sheet(dataList);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, sheet, 'Packaging');

        // 엑셀 파일 생성
        const excelBuffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'array' });

        // Blob 형태로 변환하여 다운로드
        const blob = new Blob([excelBuffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
        const url = window.URL.createObjectURL(blob);

        const a = document.createElement('a');
        a.href = url;
        a.download = filename;
        a.click();
    }
});

