% Fauzan Firdaus | 1301164317 | IF-40-04
% File ini adalah main program. Harap melakukan proses running dengan versi
% Matlab R2018A agar tidak terjadi kesalahan / error.

clear all; clc; % Menghapus variabel di workspace dan mereset command window
load DataTugas3ML2019.txt; % Meload dataset
dataset = DataTugas3ML2019; % Menyimpan dataset kedalam variabel 'dataset'

posisiTerkiniX = 15; % Titik awal baris objek berada
posisiTerkiniY = 1; % Titik awal kolom objek berada

posisiFinishX = 1; % Titik tujuan baris objek
posisiFinishY = 15; % Titik tujuan kolom objek

learningRate = 1; % Inisialisasi learning rate (alpha)
epsilon = 1; % Inisialisasi epsilon (gama)

[indeksQTable,data] = initializeIndexForQTable(dataset); % Membuat array 
% 'indeksQTable' berisi 1-225 pada array 2 dimensi 15 x 15, dan membuat
% variabel 'data' sebagai array dataset yang dibuat dalam 1 baris yang akan
% digunakan untuk menghitung reward di baris program kemudian.

QTable = initializeQTable(); % Inisialisasi QTable

loopingForever = true; % Set loopingForever menjadi true

for i=1:300 % Membuat perulangan sebagai jumlah episode sebanyak 500 episode
    while loopingForever==true % Looping sampai titik start = titik finish/goal
        if (posisiTerkiniX == posisiFinishX) && (posisiTerkiniY == posisiFinishY) % Jika sudah finish
            loopingForever = false; % Looping berhenti
        else
            [posisiTerkiniX,posisiTerkiniY,QTable] = move(posisiTerkiniX,posisiTerkiniY,QTable,indeksQTable,learningRate,epsilon,dataset); % Objek bergerak menuju titik finish dan mengupdate QTable
        end
    end
    posisiTerkiniX = 15; % Reset baris finish kembali ke awal karena pergantian episode
    posisiTerkiniY = 1; % Reset kolom finish kembali ke awal karena pergantian episode
    loopingForever = true; % Reset loopingForever menjadi true karena pergantian episode
end

jalur = findBestTrack(QTable); % Mencari arah / jalur tujuan terbaik dari setiap dataset

jalurOptimum = findOptimumTrack(jalur,indeksQTable); % Mencari jalur optimum dari titik start hingga titik finish

rangkaianJalur = findPathOnMap(jalurOptimum,indeksQTable); % Memvisualisasi hasil 'jalurOptimum' kedalam map (bentuk array)
disp('Jalur objek bergerak berdasarkan optimum policy: ');
disp(rangkaianJalur); % Menampilkan hasil 'rangkaianJalur'

reward = CalculateReward(jalurOptimum,data); % Menghitung reward dari hasil jalur yang didapatkan
disp('Reward yang didapatkan : ');
disp(reward); % Menampilkan reward