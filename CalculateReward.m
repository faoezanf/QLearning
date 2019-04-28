function reward = CalculateReward(jalurOptimum,data)

    % Fungsi ini bertujuan untuk menghitung reward yang akan didapatkan
    % berdasarkan jalur optimum yang telah didapatkan dari QTable
    
    reward = 0; % Inisialisasi nilai reward dengan 0
    
    for i=1:length(jalurOptimum)
        reward = reward + data(jalurOptimum(i)); % Akumulasi semua nilai reward berdasarkan jalur yang ditempuh
    end
end