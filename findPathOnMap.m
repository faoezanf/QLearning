function rangkaianJalur = findPathOnMap(jalurOptimum,indeksQTable)

    % Fungsi ini bertujuan untuk membuat jalur optimal yang telah
    % dicari sebelumnya menjadi sebuah array berukuran 15 x 15. Dalam array
    % tersebut ketika ditampilkan dapat menampilkan jalur objek tersebut
    % bergerak yang ditandai dengan angka 1. Sedangkan angka 0 berarti
    % objek/agen tidak melewati blok tersebut.

    rangkaianJalur = zeros(15,15); % Inisialisasi jalur dengan 0
    bar = 1; 
    kol = 1;
    for p = 1:length(jalurOptimum)
        for m = 1:15
            for n = 1:15
                if indeksQTable(m,n) == jalurOptimum(p)
                    bar = m;
                    kol = n;
                end
            end
        end
        rangkaianJalur(bar,kol) = 1;
    end
end