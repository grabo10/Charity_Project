package pl.coderslab.charity.Donation;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;


@Service
public class DonationService {
    @Autowired
    private DonationRepository donationRepository;

    public Integer getTotalQuantity() {
        return donationRepository.findTotalQuantity();
    }
    public Long getTotalDonations() {
        return donationRepository.countTotalDonations();
    }
}


