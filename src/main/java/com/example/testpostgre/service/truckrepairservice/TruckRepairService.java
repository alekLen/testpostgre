package com.example.testpostgre.service.truckrepairservice;

import com.example.testpostgre.model.TruckRepair;

import java.util.List;
import java.util.Optional;

public interface TruckRepairService {
    void save(TruckRepair timetable) ;

    int[] saveStudentsList(List<TruckRepair> timetables) ;

    void update(TruckRepair timetable) ;

    void delete(TruckRepair timetable) ;

    List<TruckRepair> findAll() ;

    void deleteAll() ;



    Optional<TruckRepair> findById(Long id);
}
