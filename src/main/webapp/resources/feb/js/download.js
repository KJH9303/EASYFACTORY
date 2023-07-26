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
        
        // 데이터를 가져온 후 다운로드 함수 호출
        downloadExcelData(dataList);
      })
      .catch((error) => {
        console.error('데이터 가져오기 실패:', error);
        alert('데이터를 가져오는 데 실패했습니다.');
      });
  });
});

function downloadExcelData(dataList) {
  const filename = 'data.xlsx';
  const sheet = XLSX.utils.json_to_sheet(dataList);
  const workbook = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(workbook, sheet, 'Data');
  
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
        
        // 데이터를 가져온 후 다운로드 함수 호출
        downloadExcelData(dataList);
      })
      .catch((error) => {
        console.error('데이터 가져오기 실패:', error);
        alert('데이터를 가져오는 데 실패했습니다.');
      });
  });
});

function downloadExcelData(dataList) {
  // 칼럼 순서를 정렬하는 기준으로 칼럼명을 배열에 작성합니다.
  const columnOrder = ['opratio', 'temp', 'tr', 'fal', 'stock', 'costs', 'usingratio', 'hiredate']; // 여기에 실제 칼럼명을 넣어주세요.

  // 칼럼 순서를 기준으로 데이터를 정렬합니다.
  const sortedDataList = dataList.map(item => {
    const sortedItem = {};
    columnOrder.forEach(column => {
      sortedItem[column] = item[column];
    });
    return sortedItem;
  });

  const filename = 'data.xlsx';
  const sheet = XLSX.utils.json_to_sheet(sortedDataList); // 정렬된 데이터를 사용합니다.
  const workbook = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(workbook, sheet, 'Data');
  
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
        
        // 데이터를 가져온 후 다운로드 함수 호출
        downloadExcelData(dataList);
      })
      .catch((error) => {
        console.error('데이터 가져오기 실패:', error);
        alert('데이터를 가져오는 데 실패했습니다.');
      });
  });
});

function downloadExcelData(dataList) {
  const filename = 'data.xlsx';
  const sheet = XLSX.utils.json_to_sheet(dataList);
  const workbook = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(workbook, sheet, 'Data');
  
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
        
        // 데이터를 가져온 후 다운로드 함수 호출
        downloadExcelData(dataList);
      })
      .catch((error) => {
        console.error('데이터 가져오기 실패:', error);
        alert('데이터를 가져오는 데 실패했습니다.');
      });
  });
});

function downloadExcelData(dataList) {
  const filename = 'data.xlsx';
  const sheet = XLSX.utils.json_to_sheet(dataList);
  const workbook = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(workbook, sheet, 'Data');
  
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
        
        // 데이터를 가져온 후 다운로드 함수 호출
        downloadExcelData(dataList);
      })
      .catch((error) => {
        console.error('데이터 가져오기 실패:', error);
        alert('데이터를 가져오는 데 실패했습니다.');
      });
  });
});

function downloadExcelData(dataList) {
  const filename = 'data.xlsx';
  const sheet = XLSX.utils.json_to_sheet(dataList);
  const workbook = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(workbook, sheet, 'Data');
  
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
        
        // 데이터를 가져온 후 다운로드 함수 호출
        downloadExcelData(dataList);
      })
      .catch((error) => {
        console.error('데이터 가져오기 실패:', error);
        alert('데이터를 가져오는 데 실패했습니다.');
      });
  });
});

function downloadExcelData(dataList) {
  const filename = 'data.xlsx';
  const sheet = XLSX.utils.json_to_sheet(dataList);
  const workbook = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(workbook, sheet, 'Data');
  
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
        
        // 데이터를 가져온 후 다운로드 함수 호출
        downloadExcelData(dataList);
      })
      .catch((error) => {
        console.error('데이터 가져오기 실패:', error);
        alert('데이터를 가져오는 데 실패했습니다.');
      });
  });
});

function downloadExcelData(dataList) {
  const filename = 'data.xlsx';
  const sheet = XLSX.utils.json_to_sheet(dataList);
  const workbook = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(workbook, sheet, 'Data');
  
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
        
        // 데이터를 가져온 후 다운로드 함수 호출
        downloadExcelData(dataList);
      })
      .catch((error) => {
        console.error('데이터 가져오기 실패:', error);
        alert('데이터를 가져오는 데 실패했습니다.');
      });
  });
});

function downloadExcelData(dataList) {
  const filename = 'data.xlsx';
  const sheet = XLSX.utils.json_to_sheet(dataList);
  const workbook = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(workbook, sheet, 'Data');
  
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